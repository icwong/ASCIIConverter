class MainController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    @posts = Post.all.order(id: :asc)
  end


  def dummy
  end


  def editor
  end

  def compare
    @job_one = Post.find(params[:j1])
    @job_two = Post.find(params[:j2])
  end
end
