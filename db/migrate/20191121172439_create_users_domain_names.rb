class CreateUsersDomainNames < ActiveRecord::Migration[6.0]
  def change
    create_table :user_domain_names do |t|
      t.integer :domain_name_id
      t.integer :user_id
    end

  end
end
