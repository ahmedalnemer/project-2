class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:edit, :update, :destroy, :create, :new]
  def index
    @posts = Post.all
  end
end
