# [Grape](https://github.com/intridea/grape) + [Goliath](https://github.com/postrank-labs/goliath) Example REST API

## What is this?

* Grape is micro-framework for creating REST-like APIs in Ruby.
* Goliath is a non-blocking Ruby web server

Together you can create a highly scalable API and use the nice features of Grape to specify how your REST API will work.

## Getting Started

First take a copy of the project

    git clone https://github.com/djones/grape-goliath-example.git
    cd grape-goliath-example/

Install dependencies

    bundle install

Next create and migrate your database

    rake db:setup

Finally start the server and you're done!

    ruby server.rb -vs

Now let's list all the posts in the database:

    curl http://localhost:9000/v1/posts.json
    => []

A blank array in response tells us there are no posts yet.

## Adding a Post

    curl -X POST -d '{"post":{"title":"David Jones","body":"this is my message"}}' http://localhost:9000/v1/posts/create

Now list all the posts again

    curl http://localhost:9000/v1/posts.json
    => [{"body":"this is my message","created_at":"2012-05-11T13:35:03-07:00","id":1,"title":"David Jones","updated_at":"2012-05-11T13:35:03-07:00"}]

Your first post has now shown up.

# Next Steps

This is just a basic Grape API example. You can see the post API specified in `app/api/posts.rb`. You could expand that API and add your own models in `app/models`. Grape's readme has some [basic usage examples](https://github.com/intridea/grape#basic-usage) that will help get you started.

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

You can use Rails-like database commands.

### Locally, you can:

Drop your database:

    rake db:drop

Create your database:

    rake db:create

Migrate your database:

    rake db:migrate

Create and migrate your database:

    rake db:setup

### On Heroku, you can:

Migrate your database:

    heroku run rake db:migrate RACK_ENV=production

# Resources

* [The Grapes of Rapid](http://www.confreaks.com/videos/475-rubyconf2010-the-grapes-of-rapid) - everything you need to know about Grape.
* [Building high-performance (Ruby) web services](http://www.confreaks.com/videos/653-gogaruco2011-0-60-with-goliath-building-high-performance-ruby-web-services) - everything you need to know about Goliath.

# Todo

* Unify all the 'require' statements.
* Make it work with databases other than PostgreSQL.
* Write some tests using the API.
* Add some example authentication.
* Add support for multiple environments e.g. test, development and production.
