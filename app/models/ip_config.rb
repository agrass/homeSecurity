require 'json'
require 'rest_client'
class IpConfig < ActiveRecord::Base
  attr_accessible :ip

  def self.sendAlert(msg, user_id)
    ids1 = []
    ids1 << Device.find(User.find(user_id).device_id).key
    ids2 = []    
    UserFriend.find_all_by_user_id(user_id).each do |friend|
      ids2 << Device.find(User.find(friend.friend_id).device_id).key
    end
    @result = RestClient.post("https://android.googleapis.com/gcm/send", 
        {
                  :registration_ids => ids1,
                  :data => {:message => msg }   
                  }.to_json,
         { 'Content-Type' => 'application/json', 'Authorization' => 'key=AIzaSyAnvwkIdKFjR65RMRx5vEekA_BZVe4kXK8' } )
  
  @result2 = RestClient.post("https://android.googleapis.com/gcm/send", 
         {
                  :registration_ids => ids2,
                  :data => {:message => "Dispositivo " + User.find(user_id).name + ": " + msg  }   
                  }.to_json,
         { 'Content-Type' => 'application/json', 'Authorization' => 'key=AIzaSyAnvwkIdKFjR65RMRx5vEekA_BZVe4kXK8' } )
  end

end
