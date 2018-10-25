class Users < App
  get "/list" do
    "ユーザ一覧を表示"
  end
  get "/:id" do
    "ユーザID#{params[:id]}の情報"
  end
end
