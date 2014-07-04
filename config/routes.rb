AppEstoque::Application.routes.draw do

  get "produtos/download"
  post "produtos/importar_arquivo"
  get "produtos/remover_arquivo"
  root :to => "produtos#index"
  resources :produtos
end
