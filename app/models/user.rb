class User < ApplicationRecord
  has_many :notifications, dependent: :destroy
  has_many :bicycles
  has_many :favorite_bicycles
  has_many :favorites, through: :favorite_bicycles, source: :bicycle

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
