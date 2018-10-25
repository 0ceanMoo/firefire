class Members < App
  #get "/list" do
  #  "ユーザ一覧を表示"
  #end
  #get "/:id" do
  #  "ユーザID#{params[:id]}の情報"
  #end

  get "/regist" do
    slim :"members/regist"
  end

  post "/regist" do
    required_params :email, :password
  end


end
