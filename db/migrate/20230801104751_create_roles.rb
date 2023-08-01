class CreateRoles < ActiveRecord::Migration[7.0]
  def change
    create_table :roles do |t|
      t.string :employee
      t.string :admin
      t.string :superadmin

      t.timestamps
    end
  end
end
