class UsersController < ApplicationController
  def index

    @users = User.all
    @movie = Movie.new
    @movie_new = Movie.new #form_with用
  end

  def show
    @user = User.find(params[:id])
    @movie = Movie.new
    @movies = @user.movies.all
    @movie_new = Movie.new #form_with用
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:profile_image, :name, :introduction)
  end
end
