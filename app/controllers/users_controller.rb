class UsersController < ApplicationController

    before_action :set_user, only: [:show, :edit, :update]
    before_action :set_articles, only: [:show]

    def new
        @user = User.new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            session[:user_id] = @user.id
            flash[:notice] = "Welcome to beretor blog #{@user.username}"
            redirect_to articles_path
        else
          render 'new'
        end
     
    end

    def edit
    end

    def update
        if @user.update(user_params)
            flash[:notice] = "Your account information was updated successfully."
            redirect_to @user
        else
          render 'edit'
        end
    end

    def show
    end

    def index
        @users = User.paginate(page: params[:page], per_page: 2)
    end


    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

    def set_user
        @user = User.find(params[:id])
    end

    def set_articles
        @articles = @user.articles.paginate(page: params[:page], per_page: 2)
    end

end