class CreateSubmissions < ActiveRecord::Migration[6.1]
  def change
    create_table :submissions do |t|
          t.string :title
          t.integer :price
          t.string :stripe_payment_id
          t.string :status
          t.string :uuid
          t.string :subscription_id
          
          t.timestamps
    end
  end
end
