class ApplicationController < ActionController::Base
    before_action :user_not_logged_in
    helper_method :current_user, :logged_in?
    helper_method 

    private 

    def current_user
        User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!current_user
        
    end 

    def user_not_logged_in
        redirect_to signin_path if !current_user
    end 

end
