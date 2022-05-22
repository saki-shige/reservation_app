class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable
  has_many :rooms, dependent: :delete_all
  has_many :reservations, dependent: :delete_all
  has_one_attached :image
  validates :introduction, length: { maximum: 200 }
  validates :name, presence: true
end
