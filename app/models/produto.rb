class Produto < ActiveRecord::Base

	#def self.import(file)
		## atribui as variáveis informação do arquivo
		#nome = file.original_filename
		#diretorio = "public/data"
		#formato = file.content_type
		#date = Time.now

		## Uni as informções do diretorio com o nome do arquivo
		#path = File.join(diretorio , date.strftime("%d%m%Y%H%M") + "_" + nome)
		#Upload.create(:nome => date.strftime("%d%m%Y%H%M") + "_" + nome)

		# Abre e escreve dentro do arquivo e e salva nas pasta do path
		#File.open(path , "wb") {|f| f.write(file.read)}

		## Verifica o formato
		#if formato == "text/plain"
			#split = ","
		#elsif formato == "text/csv"
			#split = ";"
		#end

		## Inseri as informações do banco abre e ler linha por linha
		#File.open(path).each_line do |ls|
			#prod = ls.strip
			#produto = prod.split("#{split}")
			#if not Produto.exists?(:nome => produto[0])
				#Produto.create(:nome => produto[0], :preco => produto[1] , :quantidade => produto[2])
			#else
				#pro = Produto.find_by_nome(produto[0])
				#pro.update_attributes(:preco => produto[1] , :quantidade => produto[2])
			#end
		#end
	#end
end
