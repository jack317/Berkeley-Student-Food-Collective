class ProductsController < ApplicationController
	before_action :get_vendors

	def get_vendors
		@vendors = Vendor.all
	end

	def product_params
		params.require(:product).permit(:name, :vegan, :gluten_free, :dairy_free, :lc_based, :fair, :eco_sound, :humane, :upc, :vendor_id)
	end
	def new
		#route to new.html.haml
	end

	def create
		@product = Product.create!(product_params)
		@vendor = Vendor.find(@product.vendor_id)
        flash[:message] = "Added Product: #{@product.name} with Vendor Name: #{@vendor.name} to Database"
        redirect_to products_path
	end

	def index
		#redirect to index.html.haml
	end


end
