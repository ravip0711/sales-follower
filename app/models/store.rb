class Store < ApplicationRecord

  has_many :user_stores
  has_many :users, through: :user_stores
  has_many :deals
end
