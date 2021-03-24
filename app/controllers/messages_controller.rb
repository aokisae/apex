class MessagesController < ApplicationController
  
  before_action :require_user_logged_in
  
  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @messages = current_user.messages.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end
  
  private

  def message_params
    params.require(:message).permit(:content)
  end
  
end
