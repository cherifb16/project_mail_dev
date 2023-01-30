require 'rails_helper'

RSpec.describe "Messages", type: :system do
  before do
    driven_by(:rack_test)
  end

  describe "Messages" do
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

    it "Messages list" do
      visit "http://localhost:3000/messages"
      expect(page).to have_content("Messages")
    end
    
    it " new Messages " do
      user = User.new()
      user.email = "hypes@hype.com"
      user.pseudo = "boby"
      #user.admin = nil
      user.password = "123456"
      user.save
      message = Message.new
      message.email = "bob@bon.com"
      message.messages = "pouloulou"    
      message.user_id = user.id
      message
      message.validate
      expect(message.valid?).to be true
    end

    it " edit Messages " do
      user = User.new()
      user.email = "hypes@hype.com"
      user.pseudo = "bobo"
      #user.admin = nil
      user.password = "123456"
      user.save
      message = Message.new
      message.email = "bob@bon.com"
      message.messages = "pouloulou"
      message.user_id = user.id
      message.save
      visit "http://localhost:3000/messages/#{message.id.to_s }/edit"
      click_button "Envoyez"
      expect(page).to have_content("Aperçu du message")
    end


  end
end
