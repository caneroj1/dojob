class CreateHardOffers < ActiveRecord::Migration
  def change
    create_table :hard_offers do |t|
      t.integer   :job_id             # job that the hard offer belongs to
      t.integer   :user_id            # user that created the hard offer
      t.datetime  :date_of_job        # date the user wants to do the job / or wants the job done
      t.float     :price              # how much the user will charge / or is willing to pay
      t.timestamps
    end
  end
end
