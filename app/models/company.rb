class Company < User
  def display_name
  	@pf = Preference.find( self.id );
    return ( @pf.nil? || @pf.name.blank? ) ? self.email : self.email.split(/@/).first + "©" + @pf.name;
  end
end
