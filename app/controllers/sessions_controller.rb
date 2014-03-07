class SessionsController < ApplicationController

  # displays login form
	
    def new

  end

     # POST login action 
  def create
  	 @user = User.find_by_email(params[:email])

     if !@user
      redirect_to log_in_path, :notice => 'Username does not exist.'

    else
  	 if @user.password == params[:password]
  	 	session[:@user_id] = @user.id
  	 	redirect_to root_url, :notice => 'Welcome back' 
  	 	# + @user.email + '!'
    else
  	 	redirect_to log_in_path, :notice => 'Please enter valid information.'
  	 end
    end

 end

def index
end

  def destroy
  	session[:@user_id] = nil
  	redirect_to root_url, :notice => "Logged out!"

  end

  

  

  end