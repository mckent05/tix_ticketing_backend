# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :jwt_authenticatable,
         jwt_revocation_strategy: JwtDenylist

  enum role: { customer: 0, agent: 1 }

  has_many :comments

  validates :username, presence: true, uniqueness: true
  validates :role, presence: true, inclusion: { in: roles.keys }
end
