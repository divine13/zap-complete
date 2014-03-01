class Ecomment < ActiveRecord::Base
  belongs_to :epost
  belongs_to :user
  validates(:text, presence: true)

end

