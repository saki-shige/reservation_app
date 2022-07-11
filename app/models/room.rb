class Room < ApplicationRecord
    include CommonScope
    has_one_attached :image
    has_many :reservations, dependent: :delete_all
    belongs_to :user

    validates :name, presence: true,length: { maximum: 30 }
    validates :introduction, presence: true, length: { maximum: 100 }
    validates :price, presence: true, inclusion: { in: 1..10000000 }
    validates :address, presence: true, length: { maximum: 100 }
    validates :image, presence: true
end
