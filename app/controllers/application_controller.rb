
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect to "/articles"
  end

  #this is the index route
  get '/articles' do
    @articles = Article.all
    # puts @articles
    erb :index
  end

  #has the new form inside of it
  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @article = Article.create(params)
    redirect to "/articles/#{@article.id}"
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  # #editing existing articles
  # get '/artist/:id/edit' do
  #   @article = Article.find(params[:id])
  #   erb :edit
  # end

  #edit
  patch '/articles/:id' do
    @article = Article.find(params[:id])
    @article.update(params[:id])
    redirect to "/articles/#{@article.id}"
  end

  #destroy
  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect to "/articles"
  end

  #editing existing articles
  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

end
