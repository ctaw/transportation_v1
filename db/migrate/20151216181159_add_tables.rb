class AddTables < ActiveRecord::Migration
  def change
    # Added Columns For Users Table
    add_column :users, :first_name, :string
    add_column :users, :middle_name, :string
    add_column :users, :last_name, :string
    add_column :users, :role_id, :integer, default: 1
    add_column :users, :is_active, :integer
  end
end
