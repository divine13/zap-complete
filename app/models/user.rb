class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         attr_accessor :login


         has_attached_file :picture, :styles => { :medium => "225x225>", :thumb => "100x100>" },
                           :default_url => ":rails_root/images/:style/profile.jpg",
                           :storage=> :dropbox, :dropbox_credentials => Rails.root.join("config/dropbox.yml")


         has_many :posts
         has_many :eposts
         has_many :relashionships, foreign_key: "follower_id", dependent: :destroy
         has_many :followed_users, through: :relashionships, source: :followed
         has_many :likes, foreign_key: "user_id", dependent: :destroy

          has_many :reverse_relashionships, foreign_key: "followed_id",
                                                  class_name: "Relashionship",
                                                  dependent: :destroy

          has_many :followers, through: :reverse_relashionships, source: :follower


         has_many :permissions

         validates :name, presence: true,
          :uniqueness => {
            :case_sensitive => false
          }

         def to_s
         	"#{name || email} (#{admin? ? "Admin" : "User"})"
         end

         def following?(other_user)
          relashionships.find_by_followed_id(other_user.id)
         end

         def follow!(other_user)
          relashionships.create!(followed_id: other_user.id)
         end

         def unfollow!(other_user)
          relashionships.find_by_followed_id(other_user.id).destroy
         end
         def login=(login)
            @login = login
         end

         def login
            @login || self.name || self.email #killer line 
         end
         #keep it minimul just to like for now
         def like_post!(post)
           likes.create!(epost_id: post.id, like: 1)
         end

         def feed
          Epost.from_users_followed_by(self)
         end

        def unlike!(post)
          likes.create!(post_id: post.id, like: 1, epost_id: 0)
        end

end
