class AdminController < ApplicationController
  
    
  def index
    @users = User.all.order(id: :asc)
  end
end
