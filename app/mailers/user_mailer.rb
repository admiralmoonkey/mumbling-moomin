class UserMailer < ApplicationMailer
  default from: "contact@valpurisprintshop.com"

  def contact_form(email, name, message)
    mail(:from => email),
      :to => 'admiralmoonkey@gmail.com'
      :subject => "A new contact form message from #{name}")
  end
end
