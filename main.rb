require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require './services/Api_connect_logic.rb'

ActiveRecord::Base.establish_connection(
    "adapter" => "sqlite3",
    "database" => "./bbs.db"
)

class Comment < ActiveRecord::Base
end

get '/' do
    @title = "BBS"
    @allcomments = Comment.order("id desc").all
    erb :index
end

post '/new' do
    Comment.create({:body => params[:body]})
    redirect '/'
end

get '/connect_api' do
  @title = 'API接続ツール'
  erb :api_connect
end

post '/result_api' do
  @title = "API接続結果"
  @res_body = Api_connect_logic.new.get_api(params[:reqUrl])
  erb :api_result, :layout => false
end
