class Project < ApplicationRecord
  validates :name, presence: true
  validates :code, presence: true, uniqueness: true
  
  has_many :project_investigators
  has_many :investigators, through: :project_investigators

  has_many :articles, dependent: :destroy
  has_one :minute, dependent: :destroy

  accepts_nested_attributes_for :project_investigators, reject_if: ->(attributes) { attributes["name"].blank? }, allow_destroy: true
end
