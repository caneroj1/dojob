class AddUsernameToHardOffers < ActiveRecord::Migration
  def change
    add_column :hard_offers, :username, :string
  end
end
