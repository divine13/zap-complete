class Epost < ActiveRecord::Base

  has_many :epost_likes, through: :likes, source: "epost_id"
  belongs_to :user
  has_many :ecomments
  has_attached_file :picture,
                    :styles => { :thumb => "367x210>"},
   :storage=> :dropbox, :dropbox_credentials => Rails.root.join("config/dropbox.yml")


  validates(:about, presence: true, length: { minimum: 5 })

  default_scope order: 'eposts.created_at DESC'

def self.from_users_followed_by(user)
  followed_user_ids = user.followed_user_ids
  where("user_id IN (?) OR user_id = ?", followed_user_ids, user)
end

end
