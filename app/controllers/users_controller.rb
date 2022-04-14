class UsersController < ApplicationController

    before_action :set_user, only: [:show]
    before_action :set_articles, only: [:show]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)

     
    end

    def edit
        @user = User.find(params[:id])
        
    
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            flash[:notice] = "Your account information was updated successfully."
            redirect_to articles_path
        else
          render 'edit'
        end
    end

    def Show
       
      
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def set_articles
        @articles = @user.articles
    end

end