Rails.application.routes.draw do
get 'todolists/new'
# For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
get 'top' => 'homes#top'
post 'todolists' => 'todolists#create'
get 'todolists' => 'todolists#index'
# .../todolists/1 や .../todolists/3 に該当する
get 'todolists/:id' =>'todolists#show', as: 'todolist'
# as はコード内でURLをわかりやすく書くために使われます
# 「'todolists#show'の設定を、todolistとして利用できる」といういみ
get 'todolists/:id/edit' =>'todolists#edit', as: 'edit_todolist'
patch 'todolists/:id' => 'todolists#update', as: 'update_todolist'
# updateアクションでは、データの更新後に更新結果を詳細画面に表示するために、showアクションにリダイレクトさせます
delete 'todolists/:id' => 'todolists#destory', as: 'destory_todolists'

  end