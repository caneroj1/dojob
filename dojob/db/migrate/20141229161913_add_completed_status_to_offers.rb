class AddCompletedStatusToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :completed, :boolean
  end
end
