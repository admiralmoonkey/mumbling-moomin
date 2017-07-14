class OrderMailer < ApplicationMailer
  def new_order
    @user = user
    @product = product
    mail( :to => user.email, :subject => "Order confirmation").deliver_now
  end
end
