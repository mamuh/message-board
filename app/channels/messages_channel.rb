class MessagesChannel < ApplicationCable::Channel
  def subscribed
    stream_for 'messages_channel'
    ActionCable.server.broadcast 'messages_channel', "yay it works!"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
