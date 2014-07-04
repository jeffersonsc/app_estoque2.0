require "rubygems"
require "mail"
class MailServer
	loop do
		puts "==================== CONFIGURANDO CONTA DE EMAIL ========================"

		Mail.defaults do
		  retriever_method	:pop3,
												:address => "pop.gmail.com",
												:port => 995,
												:user_name => 'jeffersondasilva14@gmail.com',
												:password => 'je14051994',
												:enable_ssl => true
		end
		sleep(5)
	end
end

