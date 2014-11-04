class Job < ActiveRecord::Base
  attr_accessible :title, :tags, :frequency, :deadline, :where, :description

  validates :title, presence: true
  validates :frequency, presence: true
  validates :where, presence: true
  validates :deadline, presence: true, if: :one_time_job?
  validates :description, presence: true, length: { minimum: 30, maximum: 500, message: "is not the appropriate length" }

  belongs_to :user

  def one_time_job?
    frequency.eql?("One Time")
  end
end
