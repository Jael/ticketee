class Admin::UsersController < Admin::BaseController
  before_filter :find_user, only: [:show, :edit, :update, :destroy]
  def index
    @users = User.order(:email)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(email: params[:user][:email], password: params[:user][:password])
    @user.admin = params[:user][:admin] == '1'
    if @user.save
      redirect_to admin_users_path, notice: "User has been created."
    else
      flash[:alert] = "User has not been created."
      render :new
    end
  end

  def update
    @user.admin = params[:user][:admin] == '1'
    params[:user].delete(:admin)
    if params[:user][:password].blank?
       params[:user].delete(:password)
       params[:user].delete(:password_confirmation)
    end 
    if @user.update_attributes(params[:user])
      redirect_to admin_users_path,  notice: "User has been updated."
    else
      flash[:alert] = "User has not been updated."
      render :edit
    end
    p User.all
  end


  
  private
  def find_user
    @user = User.find(params[:id])
  end
end
