class MessagesController < ApplicationController
  before_action :require_login
  def create   
    @message = Message.new(message_params.merge(user: current_user))
  
    if @message.save
      ActionCable.server.broadcast "chat_room_channel",
                                   mod_message: chatroom_render(@message)
    else
      render "index"
    end
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  def chatroom_render message
    render(partial: 'chatrooms/message', locals: { message: message })
  end
end
