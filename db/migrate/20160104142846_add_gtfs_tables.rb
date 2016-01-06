class AddGtfsTables < ActiveRecord::Migration
  
  def change
    create_table :countries do |t|
      t.string :code
      t.string :name
    end

    create_table :places do |t|
      t.string :name
      t.string :short_name
      t.string :long_name
      t.integer :country_id
      t.text :description
    end
  end

end
