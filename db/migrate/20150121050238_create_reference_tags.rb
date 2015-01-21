class CreateReferenceTags < ActiveRecord::Migration
  def change
    create_table :reference_tags do |t|

      t.timestamps
    end
  end
end
