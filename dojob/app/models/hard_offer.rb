class HardOffer < ActiveRecord::Base
  attr_accessible :date_of_job, # datetime
                  :price,       # float
                  :user_id,     # int
                  :job_id       # int


  belongs_to :job
  belongs_to :user
end
