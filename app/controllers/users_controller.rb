class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      sesstion[:user_id] = user.id
      redirect_to "/"
    else
      redirect_to "/signup"
    end
  end

  private

  def user_params
    params.reqiure(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
