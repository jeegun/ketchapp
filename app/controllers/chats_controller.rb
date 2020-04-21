class ChatsController < ApplicationController
  before_action :set_chat, only: [:show]

  def index
    @chats = Chat.includes(:recipient, :messages).find(session[:chats])
  end

  def show

  end

  def create
    # checking if there is existing chat between two and if so redirecting to that chat
    if Chat.where(["sender_id = ? AND recipient_id = ?", current_user.id, params[:user_id]]).present?
      @existing = Chat.where(["sender_id = ? AND recipient_id = ?", current_user.id, params[:user_id]]).first
      redirect_to chat_path(@existing)
    elsif Chat.where(["sender_id = ? AND recipient_id = ?", params[:user_id], current_user.id]).present?
      @existing = Chat.where(["sender_id = ? AND recipient_id = ?", params[:user_id], current_user.id]).first
      redirect_to chat_path(@existing)
    else
    # if chat dosen't exist create new one
      @chat = Chat.new
      @chat.recipient_id = params[:user_id]
      @chat.sender = current_user
      if @chat.save
        redirect_to chat_path(@chat)
      else
        redirect_to root_path
      end
    end
  end

  # def create
  #   chat = Chat.get(current_user.id, params[:user_id])
  # end

  private

  def set_chat
    @chat = Chat.find(params[:id])
  end

  def chat_params
    params.require(:chat).permit(:recipient_id)
  end
end
