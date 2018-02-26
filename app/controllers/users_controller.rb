class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]
  def create
    @user = User.new( makin_user )
    if @user.save 
      session[:user_id] = @user.id
    redirect_to '/bright_ideas'
    else 
      flash[:notice] = @user.errors.full_messages
      redirect_to "/main"
    end
  end

  def destroy
    
      session.clear
      redirect_to "/main"
    end
  def display
    @user = User.find(params[:id])
    @song_count = Idea.where(users_id: params[:id]).count
    @likes_count = Like.where(users_id: params[:id]).count
  end
  def new
  end 
  private 
  def makin_user
    params.require(:user).permit(:name, :alias, :email, :password ) 
  end 
end
