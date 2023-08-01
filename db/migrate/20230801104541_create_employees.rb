class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.integer :department_id
      t.integer :employee_id
      t.string :address
      t.integer :mobile_no
      t.integer :aadhar
      t.string :pancard
      t.date :date_of_birth

      t.timestamps
    end
  end
end
