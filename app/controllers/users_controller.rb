class UsersController < PrivateController

  before_action :authenticate_user
  # before_action :set_user, except: [:index, :new, :create]

  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:message] = "User was successfully created"
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
    if current_user.id != @user.id
      render file: "/Users/chaseterzian/workspace/07-gcamptesting/gcamp/public/nopage.html", layout: false, status: 404
      # render_404
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:message] = "User was successfully updated"
      redirect_to users_path
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:message] = "User was successfully deleted"
      redirect_to users_path
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

  # def render_404
  #   render file: "/Users/chaseterzian/workspace/07-gcamptesting/gcamp/public/404.html", layout: false, status: 404
  # end

  # def set_user
  #   @user = User.find(params[:id])
  # end


end
