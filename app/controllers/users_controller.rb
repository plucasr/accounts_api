class UsersController < ApplicationController
  before_action :set_user, only: %i[ destroy ]
  before_action :authenticate_request
  # GET /users
  def index
    user_service = Container.resolve(:user_service)
    @users = user_service.list_users(
      filter: params[:filter],
      sort: params[:sort],
      page: params[:page],
      per_page: params[:per_page]
    )
    render json: @users
  end

  # GET /users/1
  def show
    user_service = Container.resolve(:user_service)
    @user = user_service.find_user(params[:id])

    if @user
      render json: @user
    else
      render json: { error: "User not found" }, status: :not_found
    end
  end


  # POST /users
  def create
    user_service = Container.resolve(:user_service)
    result = user_service.set_user(user_params)

    if result.is_a?(User)
      render json: result, status: :created, location: result
    else
      render json: result, status: :unprocessable_entity # Render errors
    end
  end

  def update
    user_service = Container.resolve(:user_service)
    result = user_service.set_user(user_params.merge(id: params[:id]))

    if result.is_a?(User)
      render json: result
    else
      render json: result, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params.expect(:id))
    end

    def user_params
      params.require(:user).permit(:email, :password, :first_name, :last_name)
    end
end
