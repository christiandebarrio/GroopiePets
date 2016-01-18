class Pet < ActiveRecord::Base
  belongs_to :user

  validates :name, :species, :age, presence: true
  validates :age, numericality: { only_integer: true, greater_than: 0 }

  has_attached_file :avatar, styles: {medium: "200x200>", thumb: "100x100>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/
  
end
