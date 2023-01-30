require 'rails_helper'

RSpec.describe "Users", type: :system do
  before do
    driven_by(:rack_test)
  end
  

  describe "Users connexions" do
    it "(sign up/sign in)" do
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
      #byebug
      click_button "connexion"
      
      expect(page).to have_content("Connexion réussie.")
    end

    it "connection failure (Invalid Email or password.)" do
    
      visit new_user_session_path 
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
        fill_in "Password", with: "12345"
      end
          #byebug
      click_button "connexion"
      
      expect(page).to have_content("Email ou mot de passe non valide.")
    end

    it "admin user" do
        user = User.new()
        user.email = "hype@hype.com"
        user.pseudo = "bob"
        user.admin = true
        user.password = "123456"
        user.save
        confirmation = User.first.confirmation_token
        visit "http://localhost:3000/users/confirmation?confirmation_token=" + confirmation
        
        within('.form') do
          fill_in "Email", with: "hype@hype.com"
          fill_in "Password", with: "123456"
        end
        #byebug
        click_button "connexion"
      
      expect(page).to have_content("Admin")
  
    end

  end

  it "logout all listing" do
    
    visit "http://localhost:3000/products" 
    expect(page).to have_content("Tout les produits")

  end
  

  describe "Users CRUD" do

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
      #byebug
      click_button "connexion"
    
    end
    
    it "Edit" do
     
      visit "http://localhost:3000/users/edit" 
      within('.form') do
        fill_in "Email", with: "hype@hype.com"
        fill_in "mot de passe", with: "123456"
        #fill_in "mot de passe confirmation", with: "123456"
        #fill_in "mot de passe actuel", with: "123456"
      end
      click_button "Update"
      expect(page).to have_content("l'enregistrement de cette use")
    end

    it "Destroy" do
     
      #click_link('id-of-link')
      #visit "http://localhost:3000/home/private"
      visit "http://localhost:3000/users/edit" 
      find("#cancel").click
      #click_link('Cancel my account')
      #byebug
      expect(page).to have_content("Votre compte a été annulé avec succès.")
    end

    it "Read" do
     
      visit "http://localhost:3000/home/private"
      expect(page).to have_content("bob")
    end

  end

end
