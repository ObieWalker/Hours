Class ReminderMailer < ApplicationMailer

  def send_reminder_mail(email, body, link)
    @email = email
    @body = body
    @link = link
  end
end