class Message < ApplicationRecord
    belongs_to :user
    validates :email, presence: true
    validates :messages, presence: true
end
