class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :state, :city, :zip, :first_name, :last_name, :password, :address, :remember_me, :paid

  # VALIDATIONS
  validates :state, presence: true
  validates :city, presence: true
  validates :zip, presence: true, format: { with: /\A[[:digit:]]{5}\z/, message: "allows only numbers" }, length: { is: 5 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :address, presence: true
end
