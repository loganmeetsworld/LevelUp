class User < ActiveRecord::Base

  attr_accessor :login

  validates :username,
  :presence => true,
  :uniqueness => {
    :case_sensitive => false
  }

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:github], :authentication_keys => [:login]

  def self.find_for_database_authentication(warden_conditions)
      conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      where(conditions.to_hash).first
    end
  end

  def self.from_omniauth(auth)
    where(email: auth.info.email).each do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      return user
    end
    
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end
end
