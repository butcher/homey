class Comment < ApplicationRecord
  belongs_to :project
  belongs_to :user
  has_many :performed_actions

  validates :message, presence: true
end
