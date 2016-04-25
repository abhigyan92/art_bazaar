class OrdersController < ApplicationController
	def new
		@order_items = current_order.order_items

		@customer=Customer.new
	end

	def create
		@customer=Customer.new(customer_params)
		
		if @customer.save
			@customer.update_attribute(:order_id,params[:order_id])
		flash[:notice] = "Order Added successfully!"
		session.delete(:order_id)
        redirect_to root_url
        else
        flash[:notice] = "Error!!"
        render 'new'
        end
	end

	def product_params
      params.require(:customer).permit(:name,:email,:phone,:address)
    end
end
