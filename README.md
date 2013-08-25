A simple example of how to set-up/tear down Elasticsearch indices before/after Rspec examples.

Written for [ElasticSearch勉強会 第1回](http://atnd.org/event/E0018616)

To run tests
-----

1. `rake db:migrate RAILS_ENV=test`

2. Start Elasticsearch on localhost:9200

3. `bundle exec rspec`


