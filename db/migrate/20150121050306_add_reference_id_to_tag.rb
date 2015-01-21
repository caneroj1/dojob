class AddReferenceIdToTag < ActiveRecord::Migration
  def change
    add_column :reference_tags, :reference_id, :integer
  end
end
