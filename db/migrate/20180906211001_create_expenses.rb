class CreateExpenses < ActiveRecord::Migration[5.2]
  def change
    create_table :expenses do |t|
      t.string :payee
      t.date :exp_date
      t.decimal :amount, precision: 10, scale: 2
      t.integer :user_id
      t.integer :category_id
      t.timestamps
    end
  end
end
