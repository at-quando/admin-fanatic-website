module CategoriesHelper
	def category_arrays
		category_arr = Array.new
		Category.roots.each do |cats|
			child_category_arr = Array.new
			cats.descendants.each do |child_cat|
				if child_cat.leaf?
					child_category_arr.push([child_cat.title, child_cat.id ])
				end
			end
			category_arr.push([cats.title,child_category_arr])
		end
		return category_arr
	end
end
