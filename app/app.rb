require 'sinatra/base'
require_relative '../lib/bookmark_manager'

class Bookmark < Sinatra::Base
enable :sessions

get '/' do
  erb :index
end

get '/bookmarks/new' do
  erb :new_bookmark
end

post '/bookmarks' do
  url = params['url']
  title = params['title']
  BookmarkManager.create(url: params[:url], title: params[:title])
  redirect '/bookmarks'
end

get '/bookmarks' do
  @bookmarks = BookmarkManager.all
  p BookmarkManager.create
  erb :bookmarks
end

run! if app_file ==$0

end
