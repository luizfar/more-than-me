class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :location, :string
    add_column :users, :amount_raised_in_cents, :integer

    User.all.each do |user|
      user.first_name ||= 'First'
      user.last_name ||= 'Last'
      user.location ||= 'New York, USA'
      user.amount_raised_in_cents ||= 0
      user.save!
    end
  end
end
