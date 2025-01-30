class Admin < ApplicationRecord
  devise :database_authenticatable, :recoverable, :rememberable, :validatable

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true,
                      length: { minimum: 6 },
                      if: :password_required?
end