class Table < ApplicationRecord
    validates :table_name, :table_date, :table_time, :number_of_seats, presence: true
    validates :number_of_seats, numericality: { greater_than: 0}

    belongs_to :host
    has_and_belongs_to_many :users
end
