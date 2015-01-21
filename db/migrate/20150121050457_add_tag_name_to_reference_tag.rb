class AddTagNameToReferenceTag < ActiveRecord::Migration
  def change
    add_column :reference_tags, :tag_name, :string
  end
end
