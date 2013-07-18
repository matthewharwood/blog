class Work < ActiveRecord::Base
  
  

  validates :name, :presence => true

  has_many	:categoryworks
  has_many :categories, :through => :categoryworks
  accepts_nested_attributes_for :categories
 
  attr_accessible :name, :subtitle, :category_ids, :svg, :avatar, :post_a, :post_b, :post_c, :post_d
  has_attached_file :avatar, :styles => { :medium => "1280x700>", :thumb => "100x100>" }, :default_url => "/images/:style/missing.png"

   def avatar_url
     avatar.url(:medium)
   end

   def categoryworks=(works)
     binding.pry
   end 
end
