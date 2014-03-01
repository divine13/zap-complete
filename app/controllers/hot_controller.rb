class HotController < ApplicationController
  def index
    @most_likes = Like.all(order: :like)
  end
end
