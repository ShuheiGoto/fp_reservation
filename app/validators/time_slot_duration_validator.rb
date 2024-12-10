class TimeSlotDurationValidator < ActiveModel::Validator
  USABLE_MINUTES = [0, 30]
  TIME_DURATION_MINUTES = [30]

  def validate(record)
    return if record.start_at.nil? || record.end_at.nil?

    unless valid_minute?(record)
      record.errors.add(:base, "invalid minutes")
    end

    unless end_at_after_start_at?(record)
      record.errors.add(:base, "end_at before start_at")
    end

    unless valid_time_slot_duration?(record)
      record.errors.add(:base, 'invalid time slot duration')
    end
  end

  private

  def valid_minute?(record)
    min = record.start_at.min
    USABLE_MINUTES.include?(min)
  end

  def end_at_after_start_at?(record)
    start_at = record.start_at
    end_at = record.end_at

    end_at.after?(start_at)
  end

  def valid_time_slot_duration?(record)
    start_at = record.start_at
    end_at = record.end_at

    TIME_DURATION_MINUTES.include?(end_at.min - start_at.min)
  end
end
