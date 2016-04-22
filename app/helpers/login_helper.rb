module LoginHelper
  def log_in(admin)
    session[:admin_id] = admin.id
  end
  def logged_in?
    !session[:admin_id].nil?
  end

  # Logs out the current user.
  def log_out
    session.delete(:admin_id)
  end
end
