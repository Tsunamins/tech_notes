class SessionsController < ApplicationController
    skip_before_action :user_not_logged_in
    
    def new
        
    end

    def create
        #have to check in this general manner, or else doesn't try to make sure password actually matches the user
        @user = User.find_by(username: params[:user][:username])
            if @user && @user.authenticate(params[:user][:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
                #redirect_to controller: 'users', action: 'index'
            else
                return redirect_to(controller: 'sessions', action: 'new')
            end    
      end

      def logout
        session.delete :user_id
        redirect_to root_path
      end

      private 

        

end