class Work < ActiveRecord::Base
  
  

  validates :name, :presence => true

  has_many	:categoryworks
  has_many :categories, :through => :categoryworks
  accepts_nested_attributes_for :categories
  attr_accessible :name, :subtitle, :category_ids, :svg, :post_a, :post_b, :post_c, :post_d

   def categoryworks=(works)
   	binding.pry
   end 
end
