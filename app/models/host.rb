class Host < ApplicationRecord
    has_secure_password
    validates :name, presence: true
    validates :address, presence: true
    validates :phone, presence: true
    validates :email, uniqueness: true, presence: true
    validates :password, length: { minimum: 6 }

    has_many :tables
end
