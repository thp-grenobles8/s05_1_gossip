class PrivateMessagesController < ApplicationController
  before_action :authenticate_user

  def index
    @private_messages = []
    recipient_messages = JoinTablePrivateMessageUser.where(:recipient_id => current_user.id)
    recipient_messages.each do |message|
      @private_messages << PrivateMessage.find(message.private_message_id)
    end
    @private_message
  end
  
  def new
  end

  def create
    @private_message = PrivateMessage.create!(
      content:      params[:content],
      sender_id:    params[:sender_id]
    )
    JoinTablePrivateMessageUser.create!(
      private_message_id: @private_message.id,
      recipient_id:       User.find_by(first_name: params[:recipient]).id
    )
    flash[:success] = 'Message envoyé'
    redirect_to :root
  end

  def show
    @private_message = PrivateMessage.find(params[:id])
  end

  private

  def authenticate_user
    unless logged_in?
      flash[:danger] = "Connecte toi s'il te plaît"
      redirect_to new_session_path
    end
  end

end