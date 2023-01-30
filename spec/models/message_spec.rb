require 'rails_helper'

RSpec.describe Message, type: :model do
  it "no fields should be empty" do
    message = Message.new()
    message.validate
    #byebug
    expect(message.valid?).to be false
  end

  it 'registered message' do
    user = User.new()
    user.email = "hype@hype.com"
    user.pseudo = "bob"
    user.password = "babayaga"
    user.save
    message = Message.new()
    message.email = "hype@hype.com"
    message.messages = "bob est est"
    message.user_id = user.id
    
    message.validate
    expect(message.valid?).to be true
  end

  it "email can't be blank" do
    message = Message.new()
    message.email = ""
    message.messages = "bob est est"
    message.validate
    expect(message.valid?).to be false
  end

  it "message can't be blank" do
    message = Message.new()
    message.email = "hype@hype.com"
    message.messages = " "
    message.validate
    expect(message.valid?).to be false
  end

end
