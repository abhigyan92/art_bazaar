class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]

  

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

 
  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.ip_address = request.remote_ip
    @transaction.total=current_order.subtotal
    @transaction.order_id=session[:order_id]
    @admin=Admin.first


    
      if @transaction.save
        if @transaction.purchase
          session.delete(:order_id)
         # CustomerMailer.order_confirmation(@transaction).deliver_now
         CustomerMailer.admin_notify(@admin).deliver_now
          render :action => "success"
        else
          render :action => "failure"
        end
      else
        render :action => 'new'
      end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit( :first_name, :last_name, :card_type,:card_number,:card_verification, :card_expires_on)
    end
end
