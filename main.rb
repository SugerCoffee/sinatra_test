require 'sinatra'
require 'sinatra/reloader'
require 'active_record'
require './services/Api_connect_logic'

ActiveRecord::Base.establish_connection(
    "adapter" => "sqlite3",
    "database" => "./bbs.db"
)

class Comment < ActiveRecord::Base
end

class Request < ActiveRecord::Base
end

=begin
get '/' do
    @title = "BBS"
    @allcomments = Comment.order("id desc").all
    erb :index
end

post '/new' do
    Comment.create({:body => params[:body]})
    redirect '/'
end
=end

get '/connect_api' do
  @title = 'API接続ツール'
  @allRequests = Request.order("id desc").all
  erb :api_connect
end

post '/result_api' do
  if params[:action] == "save" then
    Request.create({:name => params[:name], :reqUrl => params[:reqUrl], :reqHead => params[:reqHead], :reqBody => params[:reqBody]})
    redirect '/connect_api'
  else
  @title = "API接続結果"
  @res_body = Api_connect_logic.new.get_api(params[:reqUrl])
  erb :api_result, :layout => false
  end
end

post '/delete_request' do
  Request.find(params[:id]).destroy
end
