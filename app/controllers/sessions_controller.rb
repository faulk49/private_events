class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: params[:session][:name])
    if user
      sign_in user
      redirect_to user
    else
      flash.now[:error] = 'Not an valid user'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to signin_path
  end
end
