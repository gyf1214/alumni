# Alumni
Manage & write Alumni Books online!

## Requirements
Ruby >=2.0.0

ImageMagick (with dev libs) >= 6.4.9

## Deployment
Use Bundler to install all the gems required:

    $ Bundle install
  
Checkout the deploy branch for a quick deployment, or deploy yourself:

    $ git checkout deploy
  
The `util/clt.sh` shell is provided to control the unicorn server:

    #compile asset files
    $ util/clt.sh asset
    
    #start the server
    $ util/clt.sh start
    
    #stop the server
    $ util/clt.sh stop
    
    #reload the server
    $ util/clt.sh restart
  
## Unicorn Setting
A default `unicorn.rb` is provided in the deploy branch.

## Http Server Setting
Nginx / Apache is recommended as a reverse HTTP proxy.

## Author
gyf1214

