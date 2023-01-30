require 'rails_helper'

RSpec.describe Archive, type: :model do
  it "Archived" do
      user = User.new()
      user.email = "hype@hype.com"
      user.pseudo = "bob"
      #user.admin = nil
      user.password = "babayaga"
      user.save
      user_id = user.id

      
      product = Product.new()
      product.description = "batiment"
      product.price = 1235
      #product.id = 3
      product.user_id = user_id
      product.save
      archive = Archive.new()
      archive.archive = true
      archive.product_id = product.id
      archive.validate
      #byebug
    expect(archive.valid?).to be true
  end

  it 'unarchived' do

    user = User.new()
      user.email = "hype@hype.com"
      user.pseudo = "bob"
      #user.admin = nil
      user.password = "babayaga"
      user.save
      user_id = user.id

      
      product = Product.new()
      product.description = "batiment"
      product.price = 1235
      #product.id = 3
      product.user_id = user_id
      product.save
      archive = Archive.new()
      archive.archive = false
      archive.product_id = product.id
      archive.validate
      expect(archive.valid?).to be true
    
  end
end
