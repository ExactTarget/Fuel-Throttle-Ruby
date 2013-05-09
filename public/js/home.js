$(function(){
    console.log( 'jquery should be loaded now' );
    /*
     * ET-Campaigns DataSource for Fuel UX Datagrid
     * https://github.com/adamalex/fuelux-dgdemo
     *
     * Copyright (c) 2012 Adam Alexander
     * Demo source released to public domain.
     */

    var CampaignsDataSource = function (options) {
        this._formatter = options.formatter;
        this._columns = options.columns;
    };

    CampaignsDataSource.prototype = {

        /**
         * Returns stored column metadata
         */
        columns: function () {
            return this._columns;
        },

        /**
         * Called when Datagrid needs data. Logic should check the options parameter
         * to determine what data to return, then return data by calling the callback.
         * @param {object} options Options selected in datagrid (ex: {pageIndex:0,pageSize:5,search:'searchterm'})
         * @param {function} callback To be called with the requested data.
         */
        data: function (options, callback) {
            var self = this;
            var url = '/getCampaigns';

            console.log( 'making getCampaigns call' );
            $.ajax(url, {

                // Set JSONP options for Flickr API
                dataType: 'json',
                type: 'GET'

            }).done(function (response) {
                if( response.status ) {
                    // Prepare data to return to Datagrid
                    // TODO: Update per campaign data footprint
                    var data = response.items;
                    var count = response.count;
                    var startIndex = (response.page - 1) * response.pageSize;
                    var endIndex = startIndex + response.pageSize;
                    var end = (endIndex > count) ? count : endIndex;
                    var pages = Math.ceil(response.pageSize / count);
                    var page = response.page;
                    var start = startIndex + 1;

                    var responseObj = {
                        data: data,
                        count: count,
                        start: start,
                        end: end,
                        count: count,
                        pages: pages,
                        page: page
                    };

                    // Allow client code to format the data
                    if (self._formatter) self._formatter(data);

                    console.log( 'campaign response: ', response );
                    // Return data to Datagrid
                    callback({ data: data, start: start, end: end, count: count, pages: pages, page: page });
                } else {
                    console.log( 'no response data from getCampaigns' );
                    // No search. Return zero results to Datagrid
                    callback({ data: [], start: 0, end: 0, count: 0, pages: 0, page: 0 });
                }
        });
    }
    };

    $('#campaignGrid').datagrid({
        dataSource: new CampaignsDataSource({
            columns:[{
                property: 'createdDate',
                label: 'Date Created',
                sortable: true
            },
            {
                property: 'name',
                label: 'Campaign Name',
                sortable: true
            },
            {
                property: 'description',
                label: 'Description',
                sortable: false
            }],
            formatter: function( items ) {
                $.each( items, function( index, item ) {
                    //item.createdDate = moment( item.createdDate );
                    item.name = '<a href="/details/' + item.id + '">' + item.name + '</a>';
                });
            }
        })
    });
});
