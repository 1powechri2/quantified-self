class Food < ApplicationRecord
  validates :name, uniqueness: true
end
