class UsersController < ApplicationController
    def new
      @user = User.new
    end
  
    def index; end
  
    def create
      @user = User.new(user_params)
      @user.save
      flash[:notice] = 'User created, make your login'
      redirect_to new_session_path
    end
  
    def show
      @user = User.find(params[:id])
    end
  
    private
  
    def user_params
      params.require(:user).permit(:username)
    end
    
  end