class UsersController < ApplicationController
    skip_before_action :user_not_logged_in, only: [:new, :create]
    
    def new 
    end 

    def create 
        @user = User.new(user_params)
      
        if @user.valid?
          @user.save
          
          session[:user_id] = @user.id
          
          redirect_to user_path(@user)
        else
          render :new
        end
    end
    
    def show
        
          @user = User.find_by(id: params[:id]) 
          
    end

    def edit
        @user = current_user
        
    end
    
    def update
        @user = current_user
             
        @user.update(email: params[:user][:email], concentration: params[:user][:concentration])
        redirect_to user_path(@user)
         
    end

    def user_params
        params.require(:user).permit([:username, :password, :email, :concentration])
        #all attrib must be here or they won't be saved
    end
end 