class AddAcceptedToHardOffer < ActiveRecord::Migration
  def change
    add_column :hard_offers, :accepted, :boolean
  end
end
