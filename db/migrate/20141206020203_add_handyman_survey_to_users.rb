class AddHandymanSurveyToUsers < ActiveRecord::Migration
  def change
    add_column :users, :handyman_survey, :text
  end
end
