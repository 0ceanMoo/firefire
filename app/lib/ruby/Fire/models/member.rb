module Model
  class Member < ActiveRecord::Base
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: {message: "メールアドレスは必須です"}, uniqueness: "このメールアドレスは既に登録されています", format: { with: VALID_EMAIL_REGEX, message: "メールアドレスの形式が正しくありません"}
    #validates :email, presence: {message: "メールアドレスは必須です"}, uniqueness: "このメールアドレスは既に登録されています", email: "メールアドレスの形式が正しくありません"
    validates :password, presence: {message: "パスワードは必須です"}, length: { in: 4..16, message: "パスワードは4-16文字です" }
    validates :nickname, presence: {message: "ニックネームは必須です"}, on: :update
    validates :admin, inclusion: { in: [true, false] }

    #with_options on: :regist do |r|
    #  r.validates :email, presence: true
    #  r.validates :password, presence: true
    #end

  end
end
