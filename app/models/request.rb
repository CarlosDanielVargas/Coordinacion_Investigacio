class Request < ApplicationRecord
  # Validations
  validates :title, presence: true
  validates :date, presence: true
  validates :description, presence: true

  # Associations
  has_many :articles
  belongs_to :individual


end
