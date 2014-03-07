class UsersController < ApplicationController
  
  # GET users/new

  def index
  end
  
  def new
  	@user = User.new
  end

  def edit
    @user = current_user
  end

  def update
     @user = current_user

     if @user.update(user_params)
      redirect_to root_url, :notice => 'You updated your user info.'

    else
      render 'edit'
    end

  end


  def create
  	@user = User.new(user_params)
  	if @user.save
  		session[:@user_id] = @user.id
  		redirect_to root_url, :notice => 'Signed up!'
  	else
  		render 'new'
  end
end



   private
   def user_params
    params.require(:user).permit(:email, :salt, :password, :password_confirmation)
end

end
