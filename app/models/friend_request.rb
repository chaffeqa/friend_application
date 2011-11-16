require 'valid_email'
class FriendRequest < ActiveRecord::Base
  MEANS_OF_COMMUNICATION = ["Phone","Text","Skype","Email","Face-to-Face"]
  

  validates :first_name, :presence => true, :length => { :maximum => 100 }
  validates :last_name, :presence => true, :length => { :maximum => 100 }
  validates :email, :presence => true, :email => true
  validates :times_you_will_contact_each_year, numericality: true
  validates :length_of_conversation_minute, numericality: true
  
end
