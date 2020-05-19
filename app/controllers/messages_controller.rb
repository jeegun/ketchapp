class MessagesController < ApplicationController
  def create
    @message = Message.new(message_params)
    authorize @message
    @chat = Chat.find(params[:chat_id])
    @message.chat = @chat
    @message.user = current_user
    @message.save
    # redirect_to chat_path(@chat)
    # @chat = Chat.includes(:recipient).find(params[:chat_id])
    # @message = @chat.messages.create(message_params)
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end
end
