class Job < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  attr_accessible :title, :frequency, :deadline, :where, :description

  validates :title, presence: true
  validates :frequency, presence: true
  validates :where, presence: true
  validates :deadline, presence: true, if: :one_time_job?
  validates :description, presence: true, length: { minimum: 30, maximum: 500, message: "is not the appropriate length" }

  belongs_to :user
  has_and_belongs_to_many :tags
  has_many :offers, dependent: :delete_all

  def one_time_job?
    frequency.eql?("One Time")
  end
end
Job.import # for auto sync model with elasticsearch
