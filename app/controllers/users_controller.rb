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
      @user.generate_unique_token!
  	# Tell the UserMailer to send a welcome Email after save
        
        ModelMailer.welcome_email(@user).deliver
          

        session[:@user_id] = @user.id
      redirect_to root_url, :notice => 'Signed up!'
      else
        render 'new'
      end
    end
    
    def confirm_your_email
        if @user = User.find_by_unique_token(params[:unique_token])
        flash[:notice] = "Password changed successfully"
            @user.confirm!
        else
          flash[:error] = "Can't find confirmation"
          redirect_to root_url
    end
  end


   private
   def user_params
    params.require(:user).permit(:email, :salt, :password, :password_confirmation)
end

end
