class UserMailer < ApplicationMailer
  def create_invite(from, to, _time)
    @from=from
    mail(from: from, to: to, subject: 'You have been invited by ' + from)
  end
end
