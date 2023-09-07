class Request < ApplicationRecord
  # Validations
  validates :title, presence: true
  validates :date, presence: true
  validates :description, presence: true

  # Associations
  belongs_to :individual


end
