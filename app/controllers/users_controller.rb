class UsersController < ApplicationController
    
    def show
        @user = User.find(params[:id])
    end
    
    def index
        @user = current_user
        @users = User.all
    end
    
    def edit
    end
    
    def update
    end
    

    private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
