class AddAmountToExpenses < ActiveRecord::Migration[5.2]
  def change
      add_column :expenses, :exp_amount, :float
  end
end
