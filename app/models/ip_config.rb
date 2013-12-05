require 'json'
class IpConfig < ActiveRecord::Base
  attr_accessible :ip

  def self.sendAlert()
    @result = HTTParty.post("https://android.googleapis.com/gcm/send", 
        :body => {
                  :registration_ids => ["APA91bELyUBQ74g653xzFapiFQHSRBfDuNc2FlhZgD7GRjDt0iem5ydncJ9EGPH-0VmnGwYYhdmnYau8MseWHW-ewe20ppeQOE29UsBAhhmktIwty5ycgXRUOO7pYwiB4KBx3RkSFt9o8s7DJ4tNzlzw3qWv-RWyJAz_SdlxMSbEHRqKSfydtZk"],
                  :data => {:message => "Holaaaa"}   
                  }.to_json,
        :headers => { 'Content-Type' => 'application/json', 'Authorization' => 'key=AIzaSyAnvwkIdKFjR65RMRx5vEekA_BZVe4kXK8' } )
  end
end
