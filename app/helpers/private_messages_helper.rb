module PrivateMessagesHelper
  def sender_info(private_message)
    sender_info = 
      User.find(private_message.sender_id).first_name + ' ' + 
      User.find(private_message.sender_id).last_name
  end

  def recipient_info(private_message)
    recipient_info =
      private_message.recipients.first.first_name + ' ' +
      private_message.recipients.first.last_name
  end
end