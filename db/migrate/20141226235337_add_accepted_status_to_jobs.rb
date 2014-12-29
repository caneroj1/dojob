class AddAcceptedStatusToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :accepted, :boolean
    add_column :jobs, :accepted_by, :integer
  end
end
