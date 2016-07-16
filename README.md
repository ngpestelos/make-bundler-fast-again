Example code adapted from [Make Bundler Fast Again](http://bradgessler.com/articles/docker-bundler/).

Run `docker-compose build web` to build an image for the Rails app.

Run `docker-compose run web bundle install` to install gems to the data volume.

Run `docker-compose up` to run the Rails app.
