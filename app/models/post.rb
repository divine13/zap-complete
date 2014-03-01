class Post < ActiveRecord::Base



  has_many :post_likes, through: :likes, source: "post_id"

  belongs_to :user
  has_many :comments
  has_attached_file :picture, :styles => { :thumb => "367x210>"},
                    :storage=> :dropbox, :dropbox_credentials => Rails.root.join("config/dropbox.yml")

  validates(:about, presence: true, length: { minimum: 5 })
  validates(:contact_details, presence: true, length: {minimum: 3 } )
  validates(:designer, presence: false )

    default_scope order: 'posts.created_at DESC'
end
