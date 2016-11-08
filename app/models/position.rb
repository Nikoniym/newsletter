class Position < ApplicationRecord
  has_many :customers
  has_many :users
end
