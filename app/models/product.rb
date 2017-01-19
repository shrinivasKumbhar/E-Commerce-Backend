class Product < ActiveRecord::Base
  has_many :tags
  has_many :product_images
  belongs_to :category
  has_one :cart
  belongs_to :user
  has_many :AttributeMaster

  accepts_nested_attributes_for :product_images
end
