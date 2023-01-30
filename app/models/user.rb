class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
  #validates :pseudo, presence: true
  has_one_attached :image
  has_many :products, dependent: :destroy
  has_many :messages, dependent: :destroy

end
