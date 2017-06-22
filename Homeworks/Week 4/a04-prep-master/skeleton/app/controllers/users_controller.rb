class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      login!(@user)
      redirect_to links_url
    else
      flash.now[:errors] = @user.errors.full_messages
      #CHECK THIS
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end
end