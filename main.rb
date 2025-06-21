require 'dotenv/load'
require 'sinatra'
require 'mongoid'
require 'sanitize'
require 'redcarpet'
require 'haml'

Mongoid.load!('config/mongoid.yml', :development)

set :haml, :format => :html5

# Views

require_relative 'models/blog'

get "/" do
  @blogs = Blog.order_by(:title => 1).limit(10).only(:title, :description)

  haml :index
end

get "/blog/:id" do
  @blog = Blog.where(id: params[:id]).first

  haml :blog
end