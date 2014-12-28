class LinkOffersAndHardOffers < ActiveRecord::Migration
  def change
    add_column :hard_offers, :offer_id, :integer
  end
end
