class Category < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :jobs
    belongs_to :parent_category, foreign_key: :parent_id, class_name: 'Category'
    has_many :subcategories, foreign_key: :parent_id, class_name: 'Category'
    has_many :subsubcategories, foreign_key: :parent_id, class_name: 'Category'

end
