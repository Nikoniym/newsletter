class Position < ApplicationRecord
  resourcify

  has_many :customers
  has_many :users
end
