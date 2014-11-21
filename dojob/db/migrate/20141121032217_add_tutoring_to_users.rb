class AddTutoringToUsers < ActiveRecord::Migration
  def change
    add_column :users, :tutoring_survey, :text
  end
end
