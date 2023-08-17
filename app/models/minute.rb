class Minute < ApplicationRecord
    validates :number, presence: true
    validates :date, presence: true

    has_one_attached :file
    has_many :articles, dependent: :destroy
    has_many :projects, through: :articles
    accepts_nested_attributes_for :articles, allow_destroy: true, reject_if: proc { |attr| attr["code"].blank? }
end
