class CreateLeaves < ActiveRecord::Migration[7.0]
  def change
    create_table :leaves do |t|
      t.references :employee, null: false, foreign_key: true
      t.string :leave_type
      t.date :start_date
      t.date :end_date
      t.integer :duration
      t.string :leave_status
      t.integer :leave_balance
      t.text :reason
      t.date :submission_date
      t.boolean :approval
      t.text :denial_reason

      t.timestamps
    end
  end
end
