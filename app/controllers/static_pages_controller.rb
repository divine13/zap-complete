class StaticPagesController < ApplicationController
  def index
    @post = Post.paginate(page: params[:page])
    @most_likes = Like.all(order: :like)
    @feed_items = current_user.feed.paginate(page: params[:page]) if signed_in?
  end

  def about
  end

  def contact_us
  end
end
