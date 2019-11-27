class AddUserServiceToDomainName < ActiveRecord::Migration[6.0]
  def change
    add_column :domain_names, :user_id, :integer
    add_column :domain_names, :service_id, :integer
  end
end
