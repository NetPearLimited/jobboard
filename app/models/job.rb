class Job < ApplicationRecord

 validates :title,:category_id, :description, presence: true
 validates :category, :presence => true

 belongs_to :user
 belongs_to :category , -> { order("name") }

 
 
 
 


 
  end
