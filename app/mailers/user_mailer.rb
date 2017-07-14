class UserMailer < ApplicationMailer
  default from: "from@example.com"

  def contact_form(email, name, message)
    @message = message
    mail(:from => email,
        :to => 'admiralmoonkey@gmail.com',
        :subject => "A new contact form message from #{name}")
  end

  def success_order(user, product)
    @user = user
    @product = product
    mail(:to => user.email,
        :subject => "Confirmation of payment #{product.name}")
  end
end
