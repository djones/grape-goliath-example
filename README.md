# [Grape](https://github.com/intridea/grape) + [Goliath](https://github.com/postrank-labs/goliath) Example

## What is this?

* Grape is micro-framework for creating REST-like APIs in Ruby.
* Goliath is a non-blocking Ruby web server

Together you can create a highly scalable API and use the nice features of Grape to specify how your REST API will work.

## Example features:

* ActiveRecord models
* Postgres
* Non-blocking adapters and dependancies
* DB migration and associated Rake tasks
* Deployment on Heroku

## Getting Started

    git clone https://github.com/djones/grape-goliath-example.git
    cd grape-goliath-example/

Create and migrate your database with:

    rake db:setup
  
Start the server and you're done!

    ruby server.rb -vs

Next let's list all the posts in the database:

    curl http://localhost:9000/v1/posts.json
    => []
  
A blank array in response tells us there are no posts yet.

## Adding a Post

We do a HTTP post to create a new post.

    curl -X POST -d '{"post":{"title":"David Jones","body":"this is my message"}}' http://localhost:9000/v1/posts/create

Now let's list all the posts again.
  
    curl http://localhost:9000/v1/posts.json
    => [{"body":"this is my message","created_at":"2012-05-11T13:35:03-07:00","id":1,"title":"David Jones","updated_at":"2012-05-11T13:35:03-07:00"}]

Now you see your first post has shown up.

# Next Steps

This is just a basic Grape API example. You can see the post specified in `app/api/posts_api.rb`. You could expand that API and add your own models in `app/models`.

# Deploy on Heroku

First we create a new Heroku application

    heroku create --stack cedar YOURAPPNAME
  
Next we push the code to Heroku
  
    git push heroku master
    
Finally we need to migrate the database on Heroku

    heroku run rake db:migrate RACK_ENV=production

Now you should be able to request posts from your app and get an empty array back as there are no posts saved yet.
 
    curl http://YOURAPPNAME.herokuapp.com/v1/posts.json
    => []
  
Next you could use the "Adding a Post" example above to write your first post to the server.

# Extras

*Locally only*, you can use Rails-like database commands.

Drop your database with:

    rake db:drop

Create your database with:

    rake db:create
  
Migrate your database with:

    rake db:migrate
  
Create and migrate your database with

    rake db:setup

# Resources

* [The Grapes of Rapid](http://www.confreaks.com/videos/475-rubyconf2010-the-grapes-of-rapid) - everything you need to know about Grape
* [Building high-performance (Ruby) web services](http://www.confreaks.com/videos/653-gogaruco2011-0-60-with-goliath-building-high-performance-ruby-web-services) - everything you need to know about Goliath

# Todo

* Unify all the 'require' statements.
* Make it work with databases other than Postgres.
* Write some tests using the API
* Add some example authentication
* Add support for multiple environments e.g. test, development and production
