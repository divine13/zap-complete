class Everyone::EpostsController < ApplicationController

	#I will factorise this later lets just focus on the flow of the site 
	
		before_filter :authenticate_user!, except: [:show, :index]
	before_filter :find_post, only: [:show, :edit, :update, :destroy, :like]
  before_filter :right_user?, only: [:edit, :update, :destroy]

  def index
  	@posts = Epost.paginate(page: params[:page])
  end

  def new
  	@post = current_user.eposts.build
  end

  def create 
  	@post = current_user.eposts.build(epost_params)
  	if(@post.save)
  		flash[:success] = "your post has been successfully zapped!"
  		redirect_to([:everyone, @post])
  	else
  		flash[:error] = "post could not be created "
  		render 'new'
  	end
  end

  def show
    @comment = @post.ecomments.build
    @likes = Like.count_likes_for(@post)
  end

  def edit

  end

  def update 
  	if @post.update_attributes(epost_params)
  		flash[:success] = "you post has been successfully updated(edited) "
  		redirect_to([:everyone, @post])
  	else
  		flash[:error] = "post could not updated(edited)"
  		render 'edit'
  	end
  end

  def destroy 
  	@post.destroy
    redirect_to everyone_eposts_path
  	flash[:success] = "post has been deleted"
      #redirect_to everyone_epost_path

  end

    def like
      #@post = Epost.find(params([:like][:epost_id]))
      begin
      current_user.like_post!(@post)
      flash[:success] = "you now like this page"
      redirect_to [:everyone, @post]
      rescue ActiveRecord::RecordNotUnique
        flash[:success] = "you now like this page "
        redirect_to [:everyone, @post]
       end
    end
    #add the private method later please
#--------------------private-----------------------
  def epost_params

  	prms = params.require(:epost).permit!
  	prms.merge!(user: current_user)
  end
  # def find_user
  # 	@user = User.find(params[:user_id])
  # end
   def find_post
   	@post = Epost.find(params[:id])
   end

   def right_user?
    if current_user != nil
    current_user.id == @post.user.id 
    end
  end
  #def add_one
  #   like_params[:like] = 1
  #end
  #def like_params
  #  params.require(:like).permit!
  #end
end
