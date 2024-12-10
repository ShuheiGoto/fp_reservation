class TimeSlot < ApplicationRecord
  belongs_to :financial_planner

  validates :start_at, presence: true
  validates :end_at, presence: true
  validates_with TimeSlotDurationValidator
end
