module ApplicationHelper
	
	def full_title(title)
		base_name = "Zap"
		if(title.empty?)
			base_name
		else
			"#{base_name} :: #{title}"
		end
	end

	def admins_only(&block)
		block.call if current_user.try(:admin?)  
		nil
	end
	def auth_admin(permission, thing, &block)
		block.call if(can?(permission.to_sym, thing)) ||
		current_user.try(:admin?)
		nil
	end

  #these below can be factorised and they will be 

	 def avatar_for_small(post)
         if post.picture?
          image_tag post.picture.url(:thumb)
         else 
          image_tag "thumb/profile.jpg"
         end
     end

     def avatar_for(post)
     	if post.picture?
     	image_tag post.picture.url(:medium)
     	else
     		image_tag "medium/profile.jpg"
     	end 
     end

  def show_likes_count(post)
    pluralize(Like.count_likes_for(post), "like")
  end

  def show_like_count(pro_post)
    pluralize(Like.count_like_for(pro_post), "like")
  end

  def right_user(post, &block)
    block.call if current_user.try(:admin?) ||
  if current_user != nil
     current_user.id == post.user.id
  end
    nil
  end
  #def toggle_like_button
    #if current_user.eposts.liked?
    #  link_to "Unlike", like_everyone_epost_path(post)
    #else
      #link_to "like", like_everyone_epost_path(post)
   # end
  #end
end