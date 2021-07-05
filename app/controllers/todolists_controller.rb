class TodolistsController < ApplicationController

def new
  # Viewへ渡すためのインスタンス変数に空のモデルオブジェクトを生成する。
  @list = List.new
end

# 下記がtodolistsコントローラのcreateアクション
def create
  # 1, データを新規登録するためのインスタンスを作成
  # 2,creatアクションはDBにnew（投稿）により送られた情報を保存するメゾット
  list = List.new(list_params)
  # 2, データをデータベースに保存するためのsaveメゾット実行
  # 引数で(list_params)と記載する理由は、private欄には直接、DBやビューにアクセスするアクションは記載できないため。
  list.save
  # 3, トップ画面へリダイレクト
  redirect_to todolist_path(list.id)
end

def index
  @lists = List.all
end

def show
  @list = List.find(params[:id])
# id=1のデータをfindメソッドを利用してデータベースから取得し、@listへ格納します。
end

def edit
  @list = List.find(params[:id])
end

def update
  list = List.find(params[:id])
  list.update(list_params)
  redirect_to todolist_path(list.id)
end
# updateアクションでは、データの更新後に更新結果を詳細画面に表示するために、showアクションにリダイレクトさせます

def destory
list = List.find(params[:id]) #データ（レコード）を1件取得
list.destroy  #データ（レコード）を削除
redirect_to todolists_path #投稿一覧画面へリダイレクト

end

private
# ストロングパラメータ
def list_params
  params.require(:list).permit(:title, :body, :image)

end

end