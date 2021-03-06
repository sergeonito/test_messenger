class MessagesController < ApplicationController
  before_action do
    @conversation = Conversation.find(params[:conversation_id])
  end

  def index
    @users = User.all
    @messages = @conversation.messages
    if @messages.length > 10
      @over_ten = true
      @messages = @messages[-10..-1]
    end
    if params[:m]
      @over_ten = false
      @messages = @conversation.messages
    end
    if @messages.last
      if @messages.last.user_id != current_user.id
        @messages.last.read = true
      end
    end

    @message = @conversation.messages.new
  end

  def new
    @message = @conversation.messages.new
  end

  def create
    message = @conversation.messages.new(message_params)
    if message.save
      ActionCable.server.broadcast 'messages',
                                   user_id: message.user.id,
                                   user:    message.user.full_name,
                                   time:    message.message_time,
                                   body:    message.body,
                                   room:    @conversation.id
      head :ok
    else
      redirect_to conversation_messages_path(@conversation)
    end
  end

  private
  def message_params
    params.require(:message).permit(:body, :user_id)
  end
end
