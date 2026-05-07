class PropertyMailer < ApplicationMailer
  default from: 'no-reply@example.com'

  def property_created(property)
    # binding.pry
    @property = property

    mail(
      to: "test@example.com",
      subject: "New Property Added"
    )
  end
end