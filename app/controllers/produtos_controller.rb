class ProdutosController < ApplicationController

	def index
		@produto = Produto.all
		@upload = Upload.all
	end

	def new
		@produto = Produto.new
	end

	def create

	end

	def importar_arquivo
		if params[:datafile].blank?
			flash[:error] = "O arquivo não pode ficar em branco"
			redirect_to :action => :new
		else
			#produto = Produto.import(params[:datafile])

			nome = Time.now.strftime("%d%m%Y%H%M") + "_" + params[:datafile].original_filename
			@formato = params[:datafile].content_type
			diretorio = "public/data"

			## Uni as informções do diretorio com o nome do arquivo
			path = File.join(diretorio , nome)

			# Abre e escreve dentro do arquivo e e salva nas pasta do path
			file = File.open(path , "wb") {|f| f.write(params[:datafile].read)}

			#salva arquivo no banco
			@upload = Upload.create(:nome => nome)

			redirect_to :action => :index
			flash[:notice] = "Importado"

			system("ruby /home/jefferson/applications/app_estoque/lib/upload.rb #{@upload.id} #{@formato}")
		end
	end

	def download
    arquivo = Upload.where("id = ?" , params[:arq_id])[0]
    path = "#{Rails.root}/public/data/#{arquivo.nome}"
    send_file path
	end
	def remover_arquivo
		arquivo = Upload.where("id = ?" , params[:arq_id])[0]
		path = "#{Rails.root}/public/data/#{arquivo.nome}"
		system("rm -rf #{path}")
		Upload.destroy(params[:arq_id])
		flash[:notice] = "Arquivo removido"
		redirect_to :action => :index
	end
end