class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.string :first_name
      t.string :last_name
      t.string :contact_number
      t.string :contact_email
      t.integer :user_id
      t.timestamps
    end
  end
end
