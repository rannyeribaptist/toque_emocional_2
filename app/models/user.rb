class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates_presence_of :name, :city, :state, :segment, :role, :required => true, :on => :update
  mount_uploader :avatar, UserAvatarUploader
end
