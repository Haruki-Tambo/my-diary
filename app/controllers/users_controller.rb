class UsersController < ApplicationController
    def new
      @user = User.new
    end
    
    def create
      @user = User.new(user_params)
      
      if @user.save
        flash[:success] = "新規登録しました"
        redirect_to "/"
      else
        flash.now[:danger] = "新規登録に失敗しました"
        render :new
      end
    end
    
    
    private

    def user_params
      params.require(:user).permit(:name, :password, :password_confirmation)
    end
end
