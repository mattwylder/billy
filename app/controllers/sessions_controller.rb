class SessionsController < ApplicationController
    include SessionsHelper
  def new
  end

  def create
      user = User.find_by(name: params[:session][:name].downcase)
      if user && user.authenticate(params[:session][:password])
          log_in user
          redirect_to user
      else
          flash[:danger] = 'bill dont like'
          render 'new'
      end
  end

  def destroy
  end

end
