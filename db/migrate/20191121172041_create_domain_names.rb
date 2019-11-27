class CreateDomainNames < ActiveRecord::Migration[6.0]
  def change
    create_table :domain_names do |t|
      t.string :domain_name
      t.date :expiry_date
    end

  end
end
