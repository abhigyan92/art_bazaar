class CustomerMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.customer_mailer.order_confirmation.subject
  #
  def order_confirmation(customer)
    @customer = customer

    mail to: @customer.email,subject: "Order Confirmation"
  end

  def admin_notify(admin)
  	@admin = admin

    mail to: "abhigyan111190@gmail.com",subject: "An Order has beed placed"

  end

end
