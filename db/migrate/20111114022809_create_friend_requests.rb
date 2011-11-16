class CreateFriendRequests < ActiveRecord::Migration
  def change
    create_table :friend_requests do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :means_of_communication
      t.string :ip_address
      t.integer :times_you_will_contact_each_year
      t.integer :length_of_conversation_minute

      t.timestamps
    end
  end
end
