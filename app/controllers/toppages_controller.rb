class ToppagesController < ApplicationController
  def index
    @message = Message.all.build
    @messages = Message.all.page(params[:page])
  end
end
