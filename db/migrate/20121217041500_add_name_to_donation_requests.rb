class AddNameToDonationRequests < ActiveRecord::Migration
  def change
    add_column :donation_requests, :first_name, :string
    add_column :donation_requests, :last_name, :string
  end
end
