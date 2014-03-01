class Everyone::EcommentsController < ApplicationController
	before_filter :authenticate_user!
	before_filter :find_post
	def create 
		@comment = @post.ecomments.build(comment_params)
		if @comment.save 
			flash[:success] = "thank you for commenting"
			redirect_to([:everyone, @post]) 
		else 
			flash[:error] = "sorry could not comment"
			render template: 'everyone/eposts/show'
			#render @post
		end
	end
	def comment_params
		prms = params.require(:ecomment).permit(:text)
		prms.merge!(user: current_user)
	end
	def find_post
		@post = Epost.find(params[:epost_id])
	end
end

