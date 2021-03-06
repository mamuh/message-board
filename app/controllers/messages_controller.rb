class MessagesController < ApplicationController
  def index
    messages = Message.all
    render json: messages
  end

  def create
    message = Message.new(message_params)
    if message.save
      MessagesChannel.broadcast_to('messages_channel', {messages: Message.all})
      ActionCable.server.broadcast 'messages_channel', message.content
    end
    render json: message
  end

  private
  def message_params
    params.require(:message).permit(:content)
  end
end
