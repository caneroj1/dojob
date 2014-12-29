class AddUserChildcareSurvey < ActiveRecord::Migration
  def change
    add_column :users, :childcare_survey, :text
  end
end
