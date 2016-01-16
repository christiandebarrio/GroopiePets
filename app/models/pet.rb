class Pet < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :species, presence: true
  validates :age, presence: true
  
end
