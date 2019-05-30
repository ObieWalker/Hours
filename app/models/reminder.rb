class Reminder < ActiveRecord::Base
  validates :name, presence
  validates :email, presence: true
  validates :time, presence: true

  def send_reminder
    body = "Hi, have you logged hours for #{self.name}? This is a gentle reminder to do so."
    ReminderMailer.send_reminder_mail(self.email, body, link).deliver_now
  end

  def run_at
    minutes_to_reminder = 5.minutes
    time - minutes_to_reminder
  end
  handle_asyncronously :send_reminder, :run_at => Proc.new { |i| i.run_at }
end
