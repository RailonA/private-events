class UsersController < ApplicationController
  before_action :set_users, only: %i[ show edit update destroy ]
  before_action  :authenticate_user!, except: [:index, :show]

  # GET /users or /users.json
  def index
    @users = users.all.order("created_at DESC")
    @users = users.new  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @users = users.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @users = users.new(users_params)
   
    respond_to do |format|
      if @users.save
        cookies[:current_user_id] = user.id  
        format.html { redirect_to @users, notice: "users was successfully created." }
        format.json { render :show, status: :created, location: @users }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @users.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @users.update(users_params)
        format.html { redirect_to @users, notice: "users was successfully updated." }
        format.json { render :show, status: :ok, location: @users }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @users.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @users.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "users was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_users
      @users = users.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def users_params
      params.require(:users).permit(:usersname, :date, :location, :description)
    end
end
