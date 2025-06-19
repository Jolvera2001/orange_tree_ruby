require 'dotenv/load'
require 'sinatra'
require 'mongoid'
require 'haml'

Mongoid.load!('config/mongoid.yml', :development)

set :haml, :format => :html5

# Views

get "/" do
  'welcome!'
end