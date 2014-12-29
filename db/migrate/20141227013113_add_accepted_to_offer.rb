class AddAcceptedToOffer < ActiveRecord::Migration
  def change
    add_column :offers, :accepted, :boolean
  end
end
