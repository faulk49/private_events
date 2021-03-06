class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user
      sign_in user
      redirect_to user
    else
      flash.now[:danger] = 'Invalid Name/Password Combination'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
