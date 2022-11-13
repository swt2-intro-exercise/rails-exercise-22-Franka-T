class Paper < ApplicationRecord
    validates :title, :venue, presence: true, length:{minimum: 1}
    validates :year, presence: true, length:{minimum: 1}, numericality:{only_integer: true}

    has_and_belongs_to_many :authors

    scope :year, ->(year) {where("year == ?",year) if year.present?}
end
