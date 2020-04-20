class ChatsController < ApplicationController
  def index
    @messages = Message.order(created_at: :asc)
  end

  def show
    @chats = Chat.includes(:recipient, :messages).find(session[:chats])
  end

  def create
    @chat = Chat.get(current_user.id, params[:user_id])
  end
end
