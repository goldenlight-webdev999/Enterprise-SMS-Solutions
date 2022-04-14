class CreateBillingDetails < ActiveRecord::Migration[6.1]
  def change
    create_table :billing_details do |t|
      t.string :customer_name
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.integer :postcode
      t.string :uuid
      t.string :customer_id
      t.string :payment_id
      t.string :nameoncard
      t.timestamps
    end
  end
end
