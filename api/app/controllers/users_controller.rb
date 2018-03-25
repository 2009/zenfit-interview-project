class UsersController < ApplicationController
  before_action :authenticate_user, except: :create
  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users
  def index
    @users = policy_scope(User)

    render json: @users
  end

  # GET /users/1
  def show
    authorize @user
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(permitted_attributes(User))
    authorize @user

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    authorize @user
    if @user.update(permitted_attributes(@user))
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    authorize @user
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end
end
