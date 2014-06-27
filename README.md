Fuel-Throttle-Ruby
==============

Fuel-Throttle-Ruby

Fuel Throttle (BETA)
=========

Fuel Throttle is an acceleration project focused on application development using:

  - ExactTarget's HubApps (IMH, Interactive Marketing Hub)
  - Using the Stackato (Fuel Platform's PaaS) infrastructure

> The overriding design goal for Fuel Throttle
> is to reduce the development cycles required to 
> get application code into the Fuel Platform ecosystem. 

Version
-

0.1.0

Technological Goals
-----------

Fuel Throttle uses a variety of open source tools to reach its tech. goals:

* [Code@] - ExactTarget's Developer Community
* [Fuel API Family] - ExactTarget's RESTful based API ecosystem
* [App Center] - ExactTarget's Application Management Interface
* [Fuel UX] - The Fuel Platform control library built on Twitter's Bootstrap
* [Stackato] - ActiveState's PaaS implemented at ExactTarget
* [Twitter Bootstrap] - great UI boilerplate for modern web apps
* [Ruby] - Server-side scripting language
* [jQuery] - duh

System Requirements
--------------

Fuel Throttle requires a few components to work from end-to-end:

 * (recommended) Git: [http://git-scm.com/downloads] [git]
 * Install RVM: [https://rvm.io/rvm/install/] [RVM Install]
 * [optional] MongoDB: [http://docs.mongodb.org/manual/installation/] [MongoDB]
 * (recommended) Stackato Micro Cloud: [http://www.activestate.com/stackato/download_vm] [StackatoMC]
 * Install Stackato Client: [http://www.activestate.com/stackato/download_client] [StackatoClient]
* System Accounts:
 * QA Stackato account, please email [stackato@exacttarget.com] [stackatoAlias]

Installation
--------------
* `Ensure your system meets all requirements first`

> ###Installation Steps
>   $ git clone git@github.et.local:Platform/Fuel-Throttle-Ruby.git <YourAppName>
>   $ cd <YourAppName>
>   TODO: Add string replacements here
>   $ bundle install<br />

* Open: init.rb, stackato.yml and optionally mongo.yml file.
* Change the values named "fuelThrottleRuby" to another name of your choosing which is unique to your app

## Running Locally
    $ rackup config.ru

##Running on Stackato Micro Cloud
* Make sure you've installed the Stackato Micro Cloud and the Stackato client
* Start the Stackato Micro Cloud VM
* Make sure you're targeting the correct Stackato environment (our Micro Cloud URL)
*   stackato login
*   stackato push (from within the app's directory)
*   Answer prompts from Stackato where applicable
*   Visit your app's new URL in a browser

Project Roadmap
--------------
Fuel Throttle goals will be outlined in the project's [milestones] on Github.

Known Issues
--------------
There are several known issues as this is an organic project, please check the [issue list] for a complete current state of the project.

Contributing to Fuel Throttle
--------------
Contributions are welcomed, to contribute to Fuel Throttle:

1. Before writing code, we suggest you [search for issues](https://github.com/creatovisguru/NodeShellApp/issues?state=open) or [create a new one](https://github.com/creatovisguru/NodeShellApp/issues/new) to confirm where your contribution fits into our roadmap. 
1. Fork the Fuel Throttle repo [GitHub help](https://help.github.com/articles/fork-a-repo)
1. Make your changes, being sure to add unit tests for new or changed functionality
1. Update your fork with the latest code from Fuel Throttle, merging as necessary
1. Commit your changes (using `git commit --amend` to the original as you progress)
1. Push to your GitHub repo, using --force if you have rebased
1. Submit a pull request [GitHub help](https://help.github.com/articles/using-pull-requests)


License
-

MIT

*Free Software, Currently only recommended for internal ExactTarget usage!*

  [Michael Clark]: https://github.com/MichaelAllenClark?tab=activity
  [@creatovisguru]: http://twitter.com/bdeanindy
  [@tkauble]: https://twitter.com/tkauble
  [@kellyjandrews]: https://twitter.com/kellyjandrews
  [RVM Install]: https://rvm.io/rvm/install/
  [Twitter Bootstrap]: http://twitter.github.com/bootstrap/
  [jQuery]: http://jquery.com  
  [App Center]: https://code.exacttarget.com/appcenter
  [Fuel UX]: https://code.exacttarget.com/devcenter/fuel-ux
  [Stackato]: http://www.activestate.com/stackato
  [Fuel API Family]: https://code.exacttarget.com/devcenter/fuel-api-family
  [Code@]: https://code.exacttarget.com/
  [issue list]: https://github.com/creatovisguru/NodeShellApp/issues
  [milestones]: https://github.com/creatovisguru/NodeShellApp/issues/milestones
  [MongoDB]: http://docs.mongodb.org/manual/installation/
  [StackatoMC]: http://www.activestate.com/stackato/download_vm
  [StackatoClient]: http://www.activestate.com/stackato/download_client
  [stackatoAlias]: mailto:stackato@exacttarget.com


Copyright (c) 2013 ExactTarget, Inc.
All rights reserved.

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution.

3. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
