class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # basic user attributes
  attr_accessible :email, :state, :city, :zip, :first_name, :last_name, :password, :address, :remember_me, :paid

  # for skill surveys
  serialize(:childcare_survey, Survey::ChildcareSurvey)
  serialize(:petcare_survey, Survey::PetcareSurvey)
  serialize(:tutoring_survey, Survey::TutoringSurvey)

  # VALIDATIONS
  validates :state, presence: true
  validates :city, presence: true
  validates :zip, presence: true, format: { with: /\A[[:digit:]]{5}\z/, message: "allows only numbers" }, length: { is: 5 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true

  has_many :offers, dependent: :delete_all
  has_many :jobs, dependent: :delete_all
  has_many :comments

  def my_name
    "#{first_name} #{last_name}"
  end
end
