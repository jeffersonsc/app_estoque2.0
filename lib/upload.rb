
require "rubygems"
require "active_record"
require "pg"
require "/home/jefferson/applications/app_estoque/app/models/produto.rb"
require "/home/jefferson/applications/app_estoque/app/models/upload.rb"



ActiveRecord::Base.establish_connection({
 :adapter  => "postgresql",
 :host     => "localhost",
 :port => "5432",
 :username => "jefferson",
 :password => "je@14051994",
 :database => "upload"
})



arquivo = Upload.find_by_id(ARGV[0])

formato = ARGV[1]
path = "/home/jefferson/applications/app_estoque/public/data/#{arquivo.nome}"

## Verifica o formato
if formato == "text/plain"
	split = ","
elsif formato == "text/csv"
	split = ";"
else
	puts "formtao inválido"
end

if formato == "text/plain" or formato == "text/csv"
	## Inseri as informações do banco abre e ler linha por linha
	File.open(path).each_line do |ls|
		prod = ls.strip
		produto = prod.split("#{split}")
		if not Produto.exists?(:nome => produto[0])
			Produto.create(:nome => produto[0].strip, :preco => produto[1].strip , :quantidade => produto[2].strip)
		else
			pro = Produto.find_by_nome(produto[0])
			pro.update_attributes(:preco => produto[1].strip , :quantidade => produto[2].strip)
		end
	end
else
	puts "Arquivo inválido"
end

