

path = "/111/edit"
if path =~ %r"/(?<id>\d+)/edit"
  p 1
  p $~[:id]
else
  p 0
end

__END__
require_relative "../../model"

if 0 > 0
  member = Model::Member.new(
    email: "aaa",
    password: ""
    #email: "hogehoge@mail.com",
    #password: "abcde"
  )

  #if member.save
  if member.valid?
    p "Success create"
  else
    p member.errors[:email]
    p member.errors.messages[:email]
    p member.errors.details[:email]
    pp member.errors.messages
    pp member.errors.full_messages
    pp member.errors.details
    #member.errors.full_messages.each do |message|
    #member.errors.messages.each do |messages|
    #  p messages[0]
    #  messages[1].each do |message|
    #    p message
    #  end
    #end
    #p member.errors
    #p member.errors.inspect
    #p member.errors.messages[:email]
    #p member.errors.messages[:password]
  end
end

if 0 > 0
  member = Model::Member.find(1)
  #user.nickname = "Hoge"
  if member.save
    p "Success update"
  else
    p member.errors.messages
  end
end
