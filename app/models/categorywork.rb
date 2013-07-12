class Categorywork < ActiveRecord::Base
  

  belongs_to	:category
  belongs_to 	:work
  attr_accessible :category_id, :work_id
end
