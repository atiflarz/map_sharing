class Place < ApplicationRecord
  belongs_to :user
  has_many :place_recipients, dependent: :destroy
  has_many :recipients, through: :place_recipients 
  accepts_nested_attributes_for :place_recipients, allow_destroy: true, reject_if: :all_blank
end
