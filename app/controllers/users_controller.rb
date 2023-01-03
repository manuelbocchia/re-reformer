class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def show
    end

    def create
       #@user = User.new( username: params[:username], email: params[:email], password: params[:password])

       @user = User.new(user_params)

        if @user.save
            redirect_to users_path(@user.id)
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        @user = User.find(user_params[:id])

        if @user.update(user_params)
            redirect_to users_path(@user.id)
        else
            render :new, status: :unprocessable_entity
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :email, :password)
    end

end
