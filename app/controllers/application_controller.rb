
require_relative '../../config/environment'
require "pry"
class ApplicationController < Sinatra::Base
use Rack::MethodOverride
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  #
  # get '/' do
  #   binding.pry
  # end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])

    erb :edit
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  patch "/articles/:id" do
  @article = Article.find(params[:id])
  @article.update(params[:article])
  redirect to "/articles/#{ @article.id }"
end


  post '/articles' do
    @article = Article.create(params)
    redirect "/articles/#{@article.id}"
  end

  delete "/articles/:id" do
   Article.destroy(params[:id])
 end


end
