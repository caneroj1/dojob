class RemoveTagsFromJobs < ActiveRecord::Migration
  def change
    remove_column :jobs, :tags
  end
end
