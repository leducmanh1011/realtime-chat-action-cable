module ConversationsHelper
  def get_current_user_img user_id
    user_id == 1 ? "http://emilcarlsson.se/assets/mikeross.png" : "http://emilcarlsson.se/assets/louislitt.png"
  end
end
