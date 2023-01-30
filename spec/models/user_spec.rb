require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation of user' do
    it "no fields should be empty" do
      user = User.new()
      user.validate
      expect(user.valid?).to be false
    end

    it 'registered user' do
      user = User.new()
      user.email = "hype@hype.com"
      user.pseudo = "bob"
      user.password = "babayaga"
      user.validate
      expect(user.valid?).to be true
    end

    it "password can't be blank" do
      user = User.new()
      user.email = "hype@hype.com"
      user.pseudo = "bob"
      user.password = ""
      user.validate
      expect(user.valid?).to be false
    end

    it "pseudo can't be blank" do
      user = User.new()
      user.email = "hype@hype.com"
      user.pseudo = ""
      user.password = "123456"
      user.validate
      expect(user.valid?).to be true
    end

    it "email can't be blank" do
      user = User.new()
      user.email = ""
      user.pseudo = "bob"
      user.password = "lollol"
      user.validate
      expect(user.valid?).to be false
    end

    
  end
end
