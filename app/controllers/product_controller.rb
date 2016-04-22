class ProductController < ApplicationController
	before_action:logged_in_user,only:[:index,:edit,:update,:destroy,
		:show,:create,:order_details,:new]
	def home
		if !logged_in?
			redirect_to '/login/new'
		end
	end
	def index
		@products=Product.all
	end

	def new 
		@product=Product.new
	end

	def create
		@product=Product.new(product_params)
		if @product.save
		flash[:success] = "Product Added successfully!"
        render 'new'
        else
        flash[:success] = "Error!!"
        render 'new'
        end
	end

	def show
	end

	def edit
		@product=Product.find(params[:id])
	end

	def update
		@product=Product.find(params[:id])
		if @product.update_attributes(product_params)
			flash[:success] = "Product Added successfully!"
			redirect_to products_path
		else
			flash[:success] = "Error!!"
            render 'edit'
        end
	end

	def destroy
		Product.find(params[:id]).destroy
        flash[:success] = "Product deleted"
        redirect_to products_path
	end

	

	def order_details
	end
	private

    def product_params
      params.require(:product).permit(:name,:description,:price,:image)
    end
end
