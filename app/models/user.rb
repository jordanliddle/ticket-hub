class User < ActiveRecord::Base
  has_many :permissions
  has_secure_password
  validates :email, presence: true

  def to_s
    "#{email} (#{admin? ? "Admin" : "User" })"
  end

end
