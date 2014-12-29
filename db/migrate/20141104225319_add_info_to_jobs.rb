class AddInfoToJobs < ActiveRecord::Migration
  def change
    add_column :jobs, :title, :string
    add_column :jobs, :tags, :string
    add_column :jobs, :frequency, :string
    add_column :jobs, :deadline, :datetime
    add_column :jobs, :where, :string
    add_column :jobs, :description, :text
  end
end
