class Members < App
  # index
  #get "/" do
  #end

  # show
  #get "/:id" do
  #end

  get "/new" do
    @member = Model::Member.new
    slim :"members/new"
  end

  get "/:id/edit" do
  end

#  post "/create" do
#    required_params :email, :password
#    @member = Model::Member.new(params[:post])
#
#    if @member.save
#      #p "success"
#    else
#      slim :"members/new"
#      #p member.errors.message
#    end
#  end
#
end
