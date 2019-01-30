class ContactMailer < ApplicationMailer
  def contact_mail(contact, property)
    @contact = contact
    @property = property

    mail to: @property.user.email, subject: "お問い合わせの確認メール"
  end
end
