require 'rails_helper'

RSpec.describe "Archives", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe "archive" do
    before do

      user = User.new()
      user.email = "hype@hype.com"
      user.pseudo = "bob"
      #user.admin = nil
      user.password = "123456"
      user.save
      confirmation = User.first.confirmation_token
      visit "http://localhost:3000/users/confirmation?confirmation_token=" + confirmation
      within('.form') do
        fill_in "Email", with: "hype@hype.com"
        fill_in "Password", with: "123456"
      end
      click_button "connexion"
   
    end

    it "Archived list" do
      visit "http://localhost:3000/archives"
      expect(page).to have_content("Archive")
    end

    it "new Archived " do
      visit "http://localhost:3000/archives/new"
      click_button "Archived"
      expect(page).to have_content("produit archivé")
    end

    it " unArchived " do
      user = User.new()
      user.email = "hype@hype.com"
      user.pseudo = "bob"
      #user.admin = nil
      user.password = "123456"
      user.save
      product = Product.new()
      product.description = "batiment"
      product.price = 1235
      product.id = 3
      product.user_id = user.id
      archiv = Archive.new
      archiv.archive = true
      archiv.product_id = product.id
      archiv.save
      expect(archiv.archive).to be true

    end

  end
end
