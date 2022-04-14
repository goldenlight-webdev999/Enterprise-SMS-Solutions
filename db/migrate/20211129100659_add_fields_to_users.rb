class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    #user fields
    add_column :users, :role, :integer, null: false
    add_column :users, :stripe_customer_id, :string
    add_column :users, :subscription_status, :string
    add_column :users, :subscription_id, :string
    add_column :users, :setup_payment, :boolean, :null => false, :default => false
    add_index :users, :stripe_customer_id, unique: true
  end
end
