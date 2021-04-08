class MessagesController < ApplicationController
  
  before_action :require_user_logged_in
  
  def create
    @message = current_user.messages.build(message_params)
      if @message.save
        flash[:success] = 'メッセージを投稿しました。'
        redirect_to root_url
      else
        @messages = Message.all.order(created_at: :desc).page(params[:page])
        flash.now[:danger] = 'メッセージの投稿に失敗しました。'
        render 'toppages/index'
      end
  end
  
  def destroy
    Message.find(params[:id]).destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  private

  def message_params
    params.require(:message).permit(:content, images_attributes: [:image_url])
  end
  
end
