class Category < ActiveRecord::Base
  validates :name, :presence => true
  has_many	:categoryworks
  has_many :works, :through => :categoryworks
  accepts_nested_attributes_for :works
  attr_accessible :description, :name, :category_ids, :svg, :post_a, :post_b, :post_c, :post_d
  
end
