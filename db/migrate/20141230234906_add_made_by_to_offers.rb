class AddMadeByToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :made_by, :string
  end
end
