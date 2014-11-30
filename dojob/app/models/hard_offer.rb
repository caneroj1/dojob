class HardOffer < ActiveRecord::Base
  attr_accessible :date_of_job, # datetime
                  :price        # float

  belongs_to :job  
  belongs_to :user
end
