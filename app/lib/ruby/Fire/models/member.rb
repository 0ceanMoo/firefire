module Model
  class Member < ActiveRecord::Base
    validates :nickname, presence: true

    with_options on: :regist do |r|
      r.validates :email, presence: true
      r.validates :password, presence: true
    end
    #validates :email, presence: true on: :regist
    #validates :password, presence: true on: :regist
  end
end
