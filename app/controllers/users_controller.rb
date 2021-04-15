class UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @events_by_current_user = current_user.events
    @upcoming_events = @user.attended_events.upcoming
    @prev_events = @user.attended_events.previous
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit; end

  # POST /users
  # POST /users.json

  def create
    @user = User.new(user_params)
    @user.save
    flash[:notice] = 'User created, make your login'
    redirect_to root_path
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    @user = User.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.fetch(:user).permit(:name, :email)
  end
end
