class CreateFinancialPlanners < ActiveRecord::Migration[7.1]
  def change
    create_table :financial_planners do |t|

      t.timestamps
    end
  end
end
