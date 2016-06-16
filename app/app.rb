
ENV['RACK_ENV'] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require 'sinatra/partial'
require_relative 'data_mapper_setup'
require_relative './controllers/links'
require_relative './controllers/sign_in'
require_relative './controllers/sign_up'
require_relative './controllers/sign_out'
require_relative './controllers/tags'
require_relative './controllers/server'
