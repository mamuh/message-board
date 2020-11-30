class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_for 'messages_channel'
    ActionCable.server.broadcast 'messages_channel', "yay it works!"
  end

  def received(data)
    MessagesChannel.broadcast_to('messages_channel', {messages: Message.all})
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
