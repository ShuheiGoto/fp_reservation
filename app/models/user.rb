class User < ApplicationRecord
  delegated_type :userable, types: %w[FinancialPlanner GeneralUser], dependent: :destroy

  validates :email, presence: true
end
