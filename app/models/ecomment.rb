class Ecomment < ActiveRecord::Base
  belongs_to :epost, dependent: :destroy
  belongs_to :user, dependent: :destroy
  validates(:text, presence: true)

end

