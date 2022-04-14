class AddEmailphonenumberToBillingDetails < ActiveRecord::Migration[6.1]
  def change
    add_column :billing_details, :phonenumber, :integer, :limit => 8
    add_column :billing_details, :emailid, :string
  end
end
