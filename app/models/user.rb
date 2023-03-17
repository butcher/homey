class User < ApplicationRecord
  has_many :comments

  validates :full_name, presence: true, uniqueness: true
end
