class CustomersController < ApplicationController
  def new
  	@order_items = current_order.order_items
    @customer=Customer.new
  end

  def create
  	@customer=Customer.new(customer_params)
    @admin=Admin.first
		if @customer.save
      @customer.update_attribute(:order_id,params[:order_id])
      CustomerMailer.order_confirmation(@customer).deliver_now
      CustomerMailer.admin_notify(@admin).deliver_now
		flash[:notice] = "Order place successfully!An email has been sent to your email id"
		session.delete(:order_id)
        redirect_to root_url
        else
        #flash[:notice] = "Error!!"
        render 'new'
        end
  end

  def customer_params
      params.require(:customer).permit(:name,:email,:phone,:address)
    end
end
