class PlaceRecipient < ApplicationRecord
  belongs_to :place
  belongs_to :recipient, class_name: "User", foreign_key: "recipient_id"
end
