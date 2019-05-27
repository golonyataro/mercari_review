class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :exhibitors
  has_many :buyers
  has_many :credits

  devise :omniauthable, omniauth_providers: %i[facebook google_oauth2]
  # omniauthのコールバック時に呼ばれるメソッド
  
end