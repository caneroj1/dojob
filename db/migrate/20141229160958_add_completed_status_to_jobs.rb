class AddCompletedStatusToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :completed,   :boolean
    add_column :jobs, :completed_on, :datetime
    add_column :jobs, :completed_by, :integer
  end
end
