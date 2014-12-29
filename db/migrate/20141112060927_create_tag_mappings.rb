class CreateTagMappings < ActiveRecord::Migration
  def change
    create_table :jobs_tags, id: false do |t|
      t.integer :job_id
      t.integer :tag_id
      t.timestamps
    end
  end
end
