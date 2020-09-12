class DiariesController < ApplicationController
  before_action :require_user_logged_in, only: [:show, :edit, :update, :new, :create]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  
    
    def index
        #current_user
        if logged_in?
          @user = current_user
          @diaries = @user.diaries
          @diary = @user.diaries.last
        end
    end
    
    def show
        #current_user
        @user = current_user
        @diary = Diary.find(params[:id])
        @diaries = @user.diaries
    end
    
    def edit
        #current_user
        @user = current_user
        @diary = Diary.find(params[:id])
    end
    
    def update
        @diary = Diary.find(params[:id])
        
        if @diary.update(diary_params)
          flash[:success] = '正常に更新されました'
          redirect_to "/diaries/#{@diary.id}"
        else
          flash.now[:danger] = '更新に失敗しました'
          render :edit
        end
    end
    
    def new
      @diary = Diary.new
    end
    
    def create
      #current_user
      @user = current_user
      @diary = @user.diaries.build(diary_params)
      if @diary.save
        flash[:success] = "日記を作成しました"
        redirect_to "/diaries/#{@diary.id}"
      else
        flash.now[:danger] = "日記の作成に失敗しました"
        render :new
      end
    end
    
    def destroy
      @diary = Diary.find(params[:id])
      @diary.destroy
      flash[:success] = "日記を削除しました"
      redirect_to "/"
    end
    
    
    
    private

    
    def diary_params
      params.require(:diary).permit(:content, :title)
    end
    
    def correct_user
      @diary = current_user.diaries.find_by(id: params[:id])
      unless @diary
        redirect_to "/"
      end
    end
    
end
