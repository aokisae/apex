class ToppagesController < ApplicationController
  def index
    @messages = Message.all.page(params[:page])
  end
end
