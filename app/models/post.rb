class Post < ActiveRecord::Base
  enum status: [ :ps_normal, :ps_locked, :ps_blocked, :ps_protected ]
  enum sortable: [ :school, :company, :date ]

  validates :owner, presence: true

  def owner_name
    return self.get_owner.display_name;
  end

  def get_owner
  	return User.find( self.owner );
  end

  def readable?
  	return (self.status != :blocked ) ? true : false;
  end

end
