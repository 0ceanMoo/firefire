require_relative "../../model"


#Model::Member.valid
member = Model::Member.new(
  #email: "hogehoge@mail.com",
  #password: "abcde"
)
#p member

#if member.save(context: :regist)
#  p "Success"
#else
#  #p member.errors
#  #p member.errors.inspect
#  p member.errors.messages[:email]
#  p member.errors.messages[:password]
#end

if 1 > 0
  user = Model::Member.find(1)
  #user.nickname = "Hoge"
  if user.save
    p "Success update"
  else
    p user.errors.messages
  end
end
