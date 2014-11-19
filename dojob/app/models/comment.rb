class Comment < ActiveRecord::Base
  attr_accessible :body, :offer_id, :user_id

  validates :body, presence: :required, length: { maximum: 1000 }

  belongs_to :offer
  belongs_to :user
end
