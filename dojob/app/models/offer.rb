class Offer < ActiveRecord::Base
  attr_accessible :user_id, :job_id

  belongs_to :job
  belongs_to :user
  has_many :comments, dependent: :delete_all
end
