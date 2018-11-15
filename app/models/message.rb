class Message < ActiveRecord::Base
 belongs_to :conversation
 belongs_to :user
 validates_presence_of :body, :conversation_id, :user_id
 def message_time
   d = DateTime.now
  d.strftime("Printed on %m/%d/%Y")
 end
end
