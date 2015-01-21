class ReferenceTag < ActiveRecord::Base
  attr_accessible :tag_name

  belongs_to :reference
end
