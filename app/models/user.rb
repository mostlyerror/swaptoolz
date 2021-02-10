class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def is_admin?
    self.roles_name.include? "admin"
  end

  def is_motel?
    self.roles_name.include? "front_desk"
  end
end
