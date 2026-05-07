class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :properties, dependent: :destroy
  has_many :wishlists
  has_many :favorite_properties,
         through: :wishlists,
         source: :property

  validates :name, presence: true
  validates :phone_number, presence: true

  # enum role: { user: 0, admin: 1 }

  def wishlisted?(property)
    wishlists.exists?(property_id: property.id)
  end
end
