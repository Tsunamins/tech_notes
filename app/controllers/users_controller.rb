class UsersController < ApplicationController
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
        #return redirect_to root_path unless logged_in?
          @user = User.find_by(id: params[:id]) 
          
    end

    def edit
        @user = User.find(params[:id])
    end
    
    def update
        @user = User.find(params[:id])
        @user.update(title: params[:user][:email], description: params[:user][:favorite_wine])
        redirect_to user_path(@user)
    end

    def user_params
        params.require(:user).permit([:username, :password, :email, :favorite_wine])
        #all attrib must be here or they won't be saved
    end
end 