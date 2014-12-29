class AddUserPetcareSurvey < ActiveRecord::Migration
  def change
    add_column :users, :petcare_survey, :text
  end
end
