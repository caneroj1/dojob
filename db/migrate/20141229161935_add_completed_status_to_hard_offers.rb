class AddCompletedStatusToHardOffers < ActiveRecord::Migration
  def change
    add_column :hard_offers, :completed, :boolean
  end
end
