class Like < ActiveRecord::Base

  belongs_to :user, dependent: :destroy
  belongs_to :epost, dependent: :destroy

  validates :user_id, presence: true
  #validates :epost_id, presence: true
  #validates :post_id, presence: true
     #validates_uniqueness_of([:user_id, :post_id ])
  def self.user_likes(current_user, post_id)
    find(:first, :conditions => ['user_id = ? AND epost_id = ?', current_user.id, post_id.id] ).nil?
  end

  def self.count_likes_for(post)
       self.where(epost_id: post.id).sum(:like)
  end

  def self.count_like_for(pro_post)
    self.where(post_id: pro_post.id).sum(:like)
  end

end