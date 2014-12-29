class AddAvatarUrlToHardOffer < ActiveRecord::Migration
  def change
    add_column :hard_offers, :avatar, :string
  end
end
