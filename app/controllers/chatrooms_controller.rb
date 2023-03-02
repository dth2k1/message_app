class ChatroomsController < ApplicationController
  before_action :require_login

  def index
    @message = Message.new
    @messages = Message.custom
  end
end
