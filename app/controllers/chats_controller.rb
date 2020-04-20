class ChatsController < ApplicationController
  def index
    @chats = Chat.includes(:recipient, :messages).find(session[:chats])
  end

  def create
    @chat = Chat.get(current_user.id, params[:user_id])
  end
end
