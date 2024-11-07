class GeneralUser < ApplicationRecord
  include Userable

  delegate :first_name, :last_name, to: :user
end
