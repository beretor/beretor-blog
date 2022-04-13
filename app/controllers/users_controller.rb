class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create
        @user = User.new
       
        if @user.save
            flash[:notice] = "welcome to BERETOR"
            redirect to article_path
        else
            render 'new'
        end
    end

    private

    def users_params
        params.require(:user).permit(:username, :email, :password)
    end

end