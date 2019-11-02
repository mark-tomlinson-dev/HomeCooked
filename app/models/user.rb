class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # Ensure that a user's listings will be destroyed if user is destroyed        
  has_many :listings, dependent: :destroy
  has_one :profile
end
