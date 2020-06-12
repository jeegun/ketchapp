class MessagesController < ApplicationController
  def create
    # @message = Message.new(message_params)
    # authorize @message
    # @chat = Chat.find(params[:chat_id])
    # @message.chat = @chat
    # @message.user = current_user
    # @message.save
    # # redirect_to chat_path(@chat)
    # # @chat = Chat.includes(:recipient).find(params[:chat_id])
    # # @message = @chat.messages.create(message_params)
  end

  def create
    @message = Message.new(message_params)
    authorize @message
    @chat = Chat.find(params[:chat_id])
    @message.chat = @chat
    @message.user = current_user
    @message.save!

    ActionCable.server.broadcast "chat", message: render_message

    render :create, layout: false
  end


  def render_message
    # MessagesController.renderer.instance_variable_set(:@env, {
    #   "HTTP_HOST"=>"localhost:3000",
    #   "HTTPS"=>"off",
    #   "REQUEST_METHOD"=>"GET",
    #   "SCRIPT_NAME"=>"",
    #   "warden" => warden
    # })

    MessagesController.render(
      partial: 'messages/message',
      locals: {
        message: @message,
        current_user: current_user
      }
    )
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
