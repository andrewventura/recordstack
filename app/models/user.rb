class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  has_many :stacks
  has_many :albums, through: :stacks
  #Virtual attribute for authenticating by either username or email
  attr_accessor :login

  def self.find_first_by_auth_conditions(warden_conditions)
  	conditions = warden_conditions.dup
  	if login = conditions.delete(:login)
  	  # when allowing distinct User records with, e.g., "username" and "UserName"...
	  where(conditions).where(["username = :value OR lower(email) = lower(:value)", { :value => login }]).first
  	else
  		where(conditions).first
  	end
  end
end
