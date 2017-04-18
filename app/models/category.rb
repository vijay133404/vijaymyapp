class Category < ApplicationRecord
	has_many :blogs, :foreign_key => "categry_id", :class_name => "Blog" 
end
