class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #validations
  validates :email, presence: true, uniqueness: true
  validates :user_name, presence: true, uniqueness: true

  #associations
  has_many :places, dependent: :destroy
  has_many :place_recipients, class_name: "PlaceRecipient", foreign_key: "recipient_id"
end
