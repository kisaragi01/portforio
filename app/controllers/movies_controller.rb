class MoviesController < ApplicationController
  def index
    @movie = Movie.new
    @movies = Movie.all
    @movie_new = Movie.new #form_with用
  end

  def show
    @movie = Movie.find(params[:id])
    @movies = Movie.all #表示用
    @movie_new = Movie.new #form_with用
  end
  
  def look
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.user_id = current_user.id
    @movies = Movie.all
    url = params[:movie][:youtube_url]
    url = url.last(11)
    @movie.youtube_url = url
    if @movie.save
      flash[:notice] = "You have created movie successfully."
      redirect_to movie_path(@movie.id)
    else
      render :index
    end
  end

  def edit
    @movie = Movie.find(params[:id])
    unless @movie.user == current_user
      redirect_to movies_path
    end
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update(movie_params)
      flash[:notice] = "You have updated movie successfully."
      redirect_to movie_path(@movie.id)
    else
      render :edit
    end

  end

  def destroy
    movie = Movie.find(params[:id])
    movie.destroy
    redirect_to movies_path
  end

  private
  def movie_params
    params.require(:movie).permit(:title,:youtube_url, :body)
  end
end
