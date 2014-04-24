class User < ActiveRecord::Base
  has_many :orders

  def self.create_user(name, email)
    user = User.new
    user.name = name
    user.email = email
    user.save
    user
  end
end
