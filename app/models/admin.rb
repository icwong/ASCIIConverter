class Admin < User
  def display_name
    return "Mein Führer";
  end
	
  def admin?
    return true;
  end
end
