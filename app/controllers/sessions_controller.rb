class SessionsController < ApplicationController
  def new
  end

  def create
      user = User.find_by(name: params[:session][:email].downcase)
      if user && user.authenticate(params[:session][:password])
          #log in and show user 
      else
          flash[:danger] = 'bill dont like'
          render 'new'
      end
  end

  def destroy
  end
end
