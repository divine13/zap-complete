class LikesController < ApplicationController
  #def like
    #current_user.flag(@post, :like)
  #  if current_user.eposts.like.liked?
  #    current_user.eposts.like.unlike
  #    msg = "you now don't like this trend"
  #  else
  #    current_user.eposts.like
  #    msg = "you like this trend"
  #  end
  #  flash[:success] =  msg
  #  redirect_to everyone_epost_path
  #end
    def create
      @post = Epost.find(params([:like][:epost_id]))
      current_user.like_post(@post)
      flash[:success] = "you now like this page"
      redirect_to [:everyone, @post]
    end
    #def destroy
    #  @user = Relashionship.find(params[:id]).followed
    #  current_user.unfollow!(@user)
    #  redirect_to [:everyone, @user]
    #end
  #def like_params
  #  params.require(:like).permit!
  #end
end
