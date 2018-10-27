module Model
  class Member < ActiveRecord::Base
    has_secure_password(validations: false)
    #has_secure_password

    with_options on: :regist do |r|
      VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
      r.validates :email, presence: {message: "メールアドレスは必須です"}, uniqueness: "このメールアドレスは既に登録されています", format: { with: VALID_EMAIL_REGEX, message: "メールアドレスの形式が正しくありません"}
      r.validates :password, presence: {message: "パスワードは必須です"}, length: { in: 4..16, message: "パスワードは4-16文字です" }
    end

    with_options on: :oauth do |r|
      r.validates :provider, presence: {message: "providerは必須です"}
      r.validates :uid, presence: {message: "uidは必須です"}
      r.validates :name, presence: {message: "nameは必須です"}
      r.validates :token, presence: {message: "tokenは必須です"}
      r.validates :secret, presence: {message: "secretは必須です"}
    end

    validates :nickname, presence: {message: "ニックネームは必須です"}, on: :update
    validates :admin, inclusion: { in: [true, false] }

  end
end
