class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  extend Devise::Models
	devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
    validates :full_name,:email,:user_name,:password,:city,:country,:contact_number,presence: true
    has_many :pentings, dependent: :destroy

   	def self.find_user_details email
   	  where("email = ? or user_name = ? ",email,email).first
   	end      
end
