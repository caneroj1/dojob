class AddInfoToContact < ActiveRecord::Migration
  def change
    add_column :contacts, :contact_name, :string
  end
end
