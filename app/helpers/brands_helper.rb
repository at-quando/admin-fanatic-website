module BrandsHelper
	def brand_arrays
		brand_arr = Array.new
		@brands=Brand.select(:branch).distinct
		@brands.each do |brand|
			brand_arr.push(brand.branch)
		end
		return brand_arr
	end
end
