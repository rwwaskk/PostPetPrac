class Notifier < ActionMailer::Base
  default :from => "admin@pet2pet2013.com"

  def email_friend(article, sender_name, receiver_email)
    @micropost = article
    @sender_name = sender_name

    mail :to => receiver_email, :subject => "Interesting Article"
  end
end
