# frozen_string_literal: true
require 'dotenv/load'
require 'roda'
require 'mongoid'
require 'sanitize'
require 'redcarpet'
require 'haml'

Mongoid.load!('config/mongoid.yml', :development)

# Might need to do config.ru? not sure

require_relative 'models/blog'
class App < Roda
  plugin :render, engine: 'haml', views: 'views', layout: 'layout'
  plugin :public

  route do |r|
    r.public

    r.root do
      @blogs = Blog.order_by(:title => 1).limit(10).only(:title, :description)
      view 'index'
    end
    r.on "blog", String do |blog_id|
      @blog = Blog.where(id: blog_id).first
      view 'blog'
    end
  end
end