class MainController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @posts = Post.all.order(id: :asc)
  end


  def dummy
  end


  def editor
  end
end
