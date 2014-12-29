class ChangeTypeOfTagsInJobs < ActiveRecord::Migration
  def change
    change_column :jobs, :tags, :text
  end
end
