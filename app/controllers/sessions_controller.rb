class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	 p user
  	if user && user.authenticate(params[:session][:password])
        log_in user
      redirect_to user
      p "成功"
  	 	session[:remember_token] = user.id
  	else
      p "error"
       flash[:danger] = 'Invalid email/password combination' 
      	render 'new'
    end	

    def current_user
      User.find_by(id: session[:user_id])
    end

  	
  end
end
