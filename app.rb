require 'sinatra'
require 'sinatra/reloader'
require_relative 'metro'

get '/' do
  @lines = metro.keys
  erb :index
end

get "/trip" do
  @num_stops = metro[params[:line].to_sym].index(params[:end]) - metro[params[:line].to_sym].index(params[:start])
  erb :"trip"
end

get '/start' do
  params[:line]
  @stations = metro[params[:line].to_sym]
  erb :start
end

get '/end' do
  @stations = metro[params[:line].to_sym]
  erb :end
end
