class Article < ApplicationRecord
  belongs_to :project
  has_many :agreements, dependent: :destroy
end
