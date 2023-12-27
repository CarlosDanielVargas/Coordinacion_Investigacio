class Article < ApplicationRecord
  belongs_to :minute
  belongs_to :project, optional: true
  belongs_to :request, optional: true
  has_many :agreements, dependent: :destroy

  accepts_nested_attributes_for :agreements, allow_destroy: true, reject_if: proc { |attr| attr["code"].blank? }
end
