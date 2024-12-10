require "test_helper"

class TimeSlotTest < ActiveSupport::TestCase
  test "should save time_slot" do
    user = User.new(userable: FinancialPlanner.new)
    now = Time.current
    time_slot = TimeSlot.new(financial_planner: user.financial_planner, start_at: now, end_at: now + 30.minutes)
    assert_not time_slot.save, 'Saved the time_slot without a start_at'
  end

  test "should not save time_slot without start_at" do
    user = User.new(userable: FinancialPlanner.new)
    time_slot = TimeSlot.new(financial_planner: user.financial_planner, end_at: Time.current)
    assert_not time_slot.save, 'Saved the time_slot without a start_at'
  end

  test "should not save time_slot without end_at" do
    user = User.new(userable: FinancialPlanner.new)
    time_slot = TimeSlot.new(financial_planner: user.financial_planner, start_at: Time.current)
    assert_not time_slot.save, 'Saved the time_slot without a end_at'
  end

  test "should not save time_slot that has invalid time duration" do
    user = User.new(userable: FinancialPlanner.new)
    now = Time.current
    time_slot = TimeSlot.new(financial_planner: user.financial_planner, start_at: now, end_at: now+ 5.minutes)
    assert_not time_slot.save, 'Saved the time_slot without a end_at'
  end
end
