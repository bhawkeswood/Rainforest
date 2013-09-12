class User < ActiveRecord::Base
	has_secure_password
	validates_presence_of :password, :on => :create
	validates :password, :length => 6..20
	validates :email, :uniqueness => true

	has_many :reviews
	has_many :products, :through => :reviews

	validates_presence_of :name
end
