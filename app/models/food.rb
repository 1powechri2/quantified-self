class Food < ApplicationRecord
  validates :name, uniqueness: true
  validates_presence_of :calories
end
