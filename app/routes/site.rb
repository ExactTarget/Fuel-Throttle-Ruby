class Main < Sinatra::Base
	
	get '/login' do
		#Process jwt here and make a new stub
		session[:authStub] = ET_Client.new
		redirect to('/')
	end

    post '/login' do
        if params['jwt'] then
            session[:authStub] = ET_Client.new(false, false, request.POST)
        else
            #Process jwt here and make a new stub
            session[:authStub] = ET_Client.new
        end
        redirect to('/')
    end

	
	get '/' do
		camp = ET_Campaign.new
		camp.authStub = session[:authStub]
		campResponse = camp.get
		
		if campResponse.status then
			campResp = campResponse.results
			@campCount = campResp['count']
			@camps = campResp['items']

			c = ET_Campaign.new
			c.authStub = session[:authStub]
			c.props = { :orderBy => 'ModifiedDate DESC'}
			cResp = c.get
			
			if cResp.status then
				last = cResp.results['items'].first['modifiedDate']
				@lastEdit = DateTime.parse(last).strftime('%m/%d/%y')
			else
				haml :'pages/404'				
			end

		else
			haml :'pages/404'
		end
		haml :'pages/home'
	end

	get '/getCampaigns' do
		camp = ET_Campaign.new
		camp.authStub = session[:authStub]
		campResponse = camp.get
		campResults = campResponse.results
		c = {
			:status => campResponse.status,
			:items => campResults['items'],
			:count => campResults['count'],
			:pageSize => campResults['pageSize'],
			:page => campResults['page']
		}

		return c.to_json
	end
	
	get '/details/:id' do
		# EX: @var = 'string' (use this for templating)
		camp = ET_Campaign.new
		camp.authStub = session[:authStub]
		camp.props = {"id" => params[:id]}
		campResponse = camp.get
		campResults = campResponse.results
		p campResults
		if campResponse.status then
			@campaign = { 
				:status => campResponse.status,
				:details => campResults
			}
			haml :'pages/details'
		else
			haml :'pages/404'
		end
	end
  
	get '*' do
		@path = params[:splat]
		if File.exists? "#{File.dirname(__FILE__)}/#{@path}.haml"
			haml :"pages/#{@path}"    
		else  
			haml :'pages/404'   
		end
	end   
  
	error 404 do   
		haml :'pages/404'     
	end
  
end
