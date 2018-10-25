module Model
  class Member < ActiveRecord::Base
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    #validates :email, presence: true, uniqueness: true, length: { in: 6..64 }
    validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
    validates :password, presence: true, length: { in: 4..16 }
    validates :nickname, presence: true, on: :update

    #with_options on: :regist do |r|
    #  r.validates :email, presence: true
    #  r.validates :password, presence: true
    #end

  end
end
