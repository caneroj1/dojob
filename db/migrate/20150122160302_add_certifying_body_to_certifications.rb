class AddCertifyingBodyToCertifications < ActiveRecord::Migration
  def change
    add_column :certifications, :certifying_body, :string
  end
end
