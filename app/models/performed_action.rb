class PerformedAction < ApplicationRecord
  belongs_to :subject, polymorphic: true

  validates :action_type, presence: true
end
