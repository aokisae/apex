class ToppagesController < ApplicationController
  
  def index
    @message = Message.all.build
    @messages = Message.all.order(created_at: :desc).page(params[:page]).per(20)
    @message.images.build
  end
  
end
