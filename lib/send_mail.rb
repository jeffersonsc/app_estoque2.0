require "rubygems"
require "mail"

Mail.server_settings = {
   :address => "smtp.gmail.com",
   :port => 25,
   :domain => "gmail.com",
   :authentication => :login,
   :user_name => "jeffersondasilva14@gmail.com",
   :password => "je14051994",
}

mail = Mail.deliver do
  to      'testejefferson@gmail.com'
  from    'Jefferson Silva <jeffersondasilva14@gmail.com>'
  subject 'First multipart email sent with Mail'

  text_part do
    body 'olá'
  end

  html_part do
    content_type 'text/html; charset=UTF-8'
    body '<h1>olá</h1>'
  end
end