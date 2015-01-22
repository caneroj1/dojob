class AddAcquiredToCertifications < ActiveRecord::Migration
  def change
    add_column :certifications, :acquired, :datetime
  end
end
