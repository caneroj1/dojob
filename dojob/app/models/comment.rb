class Comment < ActiveRecord::Base
  attr_accessible :body, :offer_id, :user_id, :username, :avatar

  validates :body, presence: :required, length: { maximum: 1000 }

  belongs_to :offer
  belongs_to :user

  def is_offer?
    !(defined?(date_of_job).nil?)
  end
end
