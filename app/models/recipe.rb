class Recipe < ActiveRecord::Base
  attr_accessible :description, :name

  validates :name, :description, presence: true
  validates :description, length: { minimum: 5 }
end
