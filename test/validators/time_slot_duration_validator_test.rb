require "test_helper"

class TimeSlotDurationValidatorTest < ActiveSupport::TestCase
  user = User.new(userable: FinancialPlanner.new)
  now = Time.current

  test "should not add errors when start_at or end_at are nil" do
    time_slot = TimeSlot.new(financial_planner: user.financial_planner, start_at: nil, end_at: now + 30.minutes)
    assert_equal nil, TimeSlotDurationValidator.new.validate(time_slot), 'Passed validate with start_at or end_at are nil'
  end

  test "should add errors when invalid minutes" do
    time_slot = TimeSlot.new(financial_planner: user.financial_planner, start_at: now, end_at: now + 1.minutes)

    TimeSlotDurationValidator.new.validate(time_slot)
    assert_includes time_slot.errors.full_messages, 'invalid minutes', 'Do not have message `invalid minutes`'
  end

  test "should add errors when end_at before start_at" do
    time_slot = TimeSlot.new(financial_planner: user.financial_planner, start_at: now, end_at: now - 1.minutes)

    TimeSlotDurationValidator.new.validate(time_slot)
    assert_includes time_slot.errors.full_messages, 'end_at before start_at', 'Do not have message `end_at before start_at`'
  end
end
