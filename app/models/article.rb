class Article < ApplicationRecord
  belongs_to :minute
  belongs_to :project
  has_many :agreements, dependent: :destroy
  accepts_nested_attributes_for :agreements, allow_destroy: true, reject_if: proc { |attr| attr[""].blank? }
end
