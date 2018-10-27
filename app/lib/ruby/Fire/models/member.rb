module Model
  class Member < ActiveRecord::Base
    has_secure_password(validations: false)
    #has_secure_password

    with_options on: :regist do |r|
      VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      r.validates :email, presence: {message: "メールアドレスは必須です"}, uniqueness: {scope: :provider,message: "このメールアドレスは既に登録されています"}, format: { with: VALID_EMAIL_REGEX, message: "メールアドレスの形式が正しくありません"}
      r.validates :password, presence: {message: "パスワードは必須です"}, length: { in: 4..16, message: "パスワードは4-16文字です" }
    end

    with_options on: :twitter_login do |r|
      r.validates :provider, presence: {message: "providerは必須です"}
      r.validates :uid, presence: {message: "uidは必須です"}
      r.validates :name, presence: {message: "nameは必須です"}
      r.validates :token, presence: {message: "tokenは必須です"}
      r.validates :secret, presence: {message: "secretは必須です"}
    end

    with_options on: :facebook_login do |r|
      r.validates :provider, presence: {message: "providerは必須です"}
      r.validates :uid, presence: {message: "uidは必須です"}
      r.validates :name, presence: {message: "nameは必須です"}
      r.validates :token, presence: {message: "tokenは必須です"}
      r.validates :expires_at, presence: {message: "expires_atは必須です"}
    end

    validates :nickname, presence: {message: "ニックネームは必須です"}, on: :update
    validates :admin, inclusion: { in: [true, false] }

    def self.from_omniauth(auth)
      provider = auth.provider
      uid = auth.uid
      info = auth.info
      credentials = auth.credentials

      # validationの追加の仕方が分からない
      #Model::Member.find_or_create_by(provider: provider, uid: uid)do |member|
      #  member.name    = info.name
      #  member.token   = credentials.token
      #  member.secret  = credentials.secret
      #  member.email   = info.email if info.email
      #  member.sname   = info.nickname if info.nickname
      #end
      #

      member = Model::Member.find_by(
        provider: provider,
        uid: uid
      )

      unless member
        member = Model::Member.new(
          provider: provider,
          uid: uid,
          name: info.name,
          token: credentials.token,
        )
        member.secret     = credentials.secret              if credentials.secret
        member.expires_at = Time.at(credentials.expires_at) if credentials.expires_at

        member.email = info.email     if info.email
        member.sname = info.nickname  if info.nickname

        context = "#{provider}_login"
        member.save!(context: context.to_sym)
      end

      return member
    end
  end
end
