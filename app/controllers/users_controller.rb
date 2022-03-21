class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def show
    @list_of_articles = @user.articles
  end

  def new
    @user = User.new
  end

  def edit
  end

  def update
    if @user.update(set_params)
      flash[:notice] = "#{@user.username} was updated successfully."
      redirect_to articles_path
    else
      render 'edit'
    end
  end

  def create
    @user = User.new(set_params)

    if @user.save
      flash[:notice] = "#{@user.username} was created successfully."
      redirect_to articles_path
    else
      render 'new'
    end
  end

  def destroy

  end

  private
  def set_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find(params[:id])
  end

end