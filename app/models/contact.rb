class Contact < ActiveRecord::Base
  attr_accessible :contact_id,  # user id that this contact corresponds to
                  :contact_name # the name of the contact
end
