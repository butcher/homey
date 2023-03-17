class Project < ApplicationRecord
  has_many :comments

  enum status: {
    pending: 0,
    discussion: 1,
    implementation: 2,
    testing: 3,
    deployment: 4,
    archived: 5
  }

  validates :name, presence: true, uniqueness: true
end
