class AddAttributesToCertificates < ActiveRecord::Migration
  def change
    add_column :certifications, :expires, :datetime
    add_column :certifications, :title, :string
    add_column :certifications, :link, :string
  end
end
