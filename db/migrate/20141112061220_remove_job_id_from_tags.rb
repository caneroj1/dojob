class RemoveJobIdFromTags < ActiveRecord::Migration
  def change
    remove_column :tags, :job_id
  end
end
