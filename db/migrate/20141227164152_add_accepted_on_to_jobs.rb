class AddAcceptedOnToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :accepted_on, :datetime
  end
end
