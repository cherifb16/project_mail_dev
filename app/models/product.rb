class Product < ApplicationRecord
    has_many_attached :images
    validates :description, presence: true
    validates :price, presence: true
    validates :images, presence: false
    validate :image_type
    belongs_to :user
    has_many :archive, dependent: :destroy
    


    def thumbnail input
        return self.images[input].variant(resize: '100x100!').processed
    end

    def banner input
        return self.images[input].variant(resize: '400x200!').processed
    end

    private
    def image_type
        
        images.each do |image|
            if !image.content_type.in?(%('image/jpeg image/png'))
                errors.add(:images,"needs to be a JPEG PNG!")
            end
        end
    end
end
