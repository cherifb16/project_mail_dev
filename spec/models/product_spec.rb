require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validation of product' do
    it "no fields should be empty" do
      product = Product.new()
      product.validate
      #byebug
      expect(product.valid?).to be false
    end

    it 'registered product' do
      user = User.new()
      user.email = "hype@hype.com"
      user.pseudo = "bob"
      #user.admin = nil
      user.password = "babayaga"
      user.save
      user_id = user.id
      #byebug
      visit "http://localhost:3000/products/new"
      product = Product.new()
      product.description = "batiment"
      product.price = 1235
      product.id = 3
      product.user_id = user_id
      product.images = File.new("#{Rails.root}/public/apple-touch-icon.png")
      expect(product.valid?).to be true
      
      productImg = ActiveStorage::Blob.new()
      
      productImg.filename = "/public/apple-touch-icon.png"
      productImg.byte_size = 62583
      productImg.checksum = "kF8O2WjJCbgSa+dMc9y7Ug=="
      productImg.save
      active = ActiveStorage::Attachment.new
      active.name = "images"
      active.record_type = "Product"
      active.blob_id = productImg.id
      active.record_id = 3
      active.save
      product.images.attach()
    end

    it "price can't be blank" do
      user = User.new()
      user.email = "hype@hype.com"
      user.pseudo = "bob"
      #user.admin = nil
      user.password = "babayaga"
      user.save
      user_id = user.id
      #byebug
      product = Product.new()
      product.description = "batiment"
      product.price = ""
      product.id = 3
      #product.admin = nil
      productImg = ActiveStorage::Blob.new()
      
      productImg.filename = File.new("#{Rails.root}/public/apple-touch-icon.png")
      productImg.byte_size = 62583
      productImg.checksum = "kF8O2WjJCbgSa+dMc9y7Ug=="
      productImg.save
      active = ActiveStorage::Attachment.new
      active.name = "images"
      active.record_type = "Product"
      active.blob_id = productImg.id
      active.record_id = product.id
      #active.save
      
      product.user_id = user_id
      #byebug
      product.validate
      expect(product.valid?).to be false
      expect(product.errors.messages).to include :price
    end
    it "description can't be blank" do
      user = User.new()
      user.email = "hype@hype.com"
      user.pseudo = "bob"
      user.password = "babayaga"
      user.save
      user_id = user.id
      product = Product.new()
      product.description = ""
      product.price = 1223
      product.id = 3
      #product.admin = nil
      productImg = ActiveStorage::Blob.new()
      
      productImg.filename = File.new("#{Rails.root}/public/apple-touch-icon.png")
      productImg.byte_size = 62583
      productImg.checksum = "kF8O2WjJCbgSa+dMc9y7Ug=="
      productImg.save
      active = ActiveStorage::Attachment.new
      active.name = "images"
      active.record_type = "Product"
      active.blob_id = productImg.id
      active.record_id = product.id
      active.save
      
      Images = File.new("#{Rails.root}/public/apple-touch-icon.png")
      product.user_id = user_id
      #byebug
      product.validate
      expect(product.valid?).to be false
      expect(product.errors.messages).to include :description
    end
  end
end


