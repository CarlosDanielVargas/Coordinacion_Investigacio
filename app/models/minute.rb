class Minute < ApplicationRecord
    has_one_attached :file
    has_and_belongs_to_many :projects
    has_many :articles, dependent: :destroy
    accepts_nested_attributes_for :articles, allow_destroy: true, reject_if: proc { |attr| attr["number"].blank? }
end
