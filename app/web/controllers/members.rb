class Members < App
  get "/" do
    slim :"members/index"
  end

  get "/list" do
    @members = Model::Member.all
    slim :"members/list"
  end

  get "/new" do
    @member = Model::Member.new
    slim :"members/new"
  end

  get %r"/(\d+)", %r"/(\d+)/show" do |id|
    @member = Model::Member.find(id)
    slim :"members/show"
  end

  get %r"/(\d+)/edit" do |id|
    @member = Model::Member.find(id)
    slim :"members/edit"
  end

  post "/create" do
    required_params member:  [:email, :password]
    @member = Model::Member.new(params[:member])

    #if @member.valid?
    if @member.save(context: :regist)
      login(member)
      redirect "/members/#{@member.id}"
    else
      #p @member.errors.messages
      slim :"members/new"
    end
  end

  post %r"/(\d+)/update" do |id|
    required_params member:  [:email, :nickname]
    @member = Model::Member.find(id)

    if @member.update(params[:member])
      redirect "/members/#{@member.id}"
    else
      #p @member.errors.messages
      slim :"members/edit"
    end
  end

  #delete %r"/(\d+)/delete" do |id|
  #  @member = Model::Member.find(id)
  #  @member.destroy
  #end

end
