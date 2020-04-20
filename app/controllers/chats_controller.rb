class ChatsController < ApplicationController
    before_action :set_chat, only: [:show]


  def index
    @chats = Chat.includes(:recipient, :messages).find(session[:chats])
  end

  def show

  end

  def create
    @chat = Chat.new
    @chat.sender = current_user
    if @chat.save
      redirect_to chat_path(@chat)
    else
      redirect_to root_path
    end
  end

  # def create
  #   chat = Chat.get(current_user.id, params[:user_id])
  # end

  private

  def set_chat
    @chat = Chat.find(params[:id])
  end
end
