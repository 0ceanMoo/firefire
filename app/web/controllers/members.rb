class Members < App
  # index
  get "/" do
    @members = Model::Member.all
    slim :"members/index"
  end

  # show
  get /\/(\d+)/ do |id|
    @member = Model::Member.find(id)
    slim :"members/show"
  end

  get "/new" do
    @member = Model::Member.new
    slim :"members/new"
  end

  # edit
  get /\/(\d+)\/edit/ do |id|
    @member = Model::Member.find(id)
    slim :"members/edit"
  end

  # create
  post "/" do
    required_params member:  [:email, :password]
    @member = Model::Member.new(params[:member])

    #if @member.valid?
    if @member.save
      redirect "/members/#{@member.id}"
    else
      #p member.errors.message
      slim :"members/new"
    end
  end

  # update
  post /\/(\d+)/ do |id|
    required_params member:  [:email, :password, :nickname]
    @member = Model::Member.find(id)

    if @member.update()
      redirect "/members/#{@member.id}"
    else
      #p member.errors.message
      slim :"members/edit"
    end
  end

end
