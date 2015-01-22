class AddUserIdToCertifications < ActiveRecord::Migration
  def change
    add_column :certifications, :user_id, :integer
  end
end
