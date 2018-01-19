class User < ApplicationRecord
    has_secure_password
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :email, uniqueness: true
    validates :password, length: { minimum: 6 }

    has_and_belongs_to_many :tables
end
