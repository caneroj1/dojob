class Reference < ActiveRecord::Base
  attr_accessible :first_name, :last_name, :contact_number, :contact_email, :user_id

  validates :first_name, presence: true
  validates :last_name,  presence: true
  validates :contact_number, format: { with: /\A[0-9]{10}\z/, message: "is not correct."  }, if: :number_given?
  validates :contact_email,  format: { with:  /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, message: "is not correct." }, if: :email_given?

  has_many :tags
  belongs_to :user

  def email_given?
    contact_email
  end

  def number_given?
    contact_number
  end
end
