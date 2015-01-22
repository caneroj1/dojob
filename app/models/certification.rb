class Certification < ActiveRecord::Base
  attr_accessible :title, :expires, :link, :certifying_body, :acquired

  validates :title,           presence: true, uniqueness: { scope: :user_id }
  validates :acquired,        presence: true
  validates :expires,         presence: true
  validates :certifying_body, presence: true

  belongs_to :user
end
