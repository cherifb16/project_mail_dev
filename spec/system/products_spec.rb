require 'rails_helper'

RSpec.describe "Products", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe "Product" do
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

    it "Create" do
      
      visit "http://localhost:3000/products/new"
      fill_in "prix", with: 1235
      fill_in "Description", with: "Description"
      click_button "créer un produit"
      expect(page).to have_content("Le produit a été créé avec succès.")
    end

  it "Create errors" do

    visit "http://localhost:3000/products/new"
    fill_in "prix", with: 1235
    #fill_in "Images", with: File.new("#{Rails.root}/public/apple-touch-icon.png")
    fill_in "Description", with: ""
    #find("#prodcre").click
    click_button "créer un produit"
    expect(page).to have_content("Description can't be blank")
  end

    it "Read" do

      visit "http://localhost:3000/products"
      
      expect(page).to have_content("Tout les produits Pas de produit listé")
    end

    it "Show" do
      visit "http://localhost:3000/products/new"
      fill_in "prix", with: 1235
      fill_in "Description", with: "oba"
      click_button "créer un produit"
      expect(page).to have_content("Archive")
      
    end

  end

end
