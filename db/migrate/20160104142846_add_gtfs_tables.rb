class AddGtfsTables < ActiveRecord::Migration

  def change
    create_table :type_of_vehicles do |t|
      t.string :name
      t.text :description
    end

    create_table :vehicles do |t|
      t.string :name
      t.text :description
      t.integer :fare_id
      t.integer :type_of_vehicle_id
    end

    create_table :fares do |t|
      t.decimal :amount
      t.text :description
      t.decimal :distance
      t.integer :type_of_vehicle_id
    end

    create_table :schedules do |t|
      t.integer :vehicle_id
      t.string :start_time
      t.string :end_time
      t.text :description
    end

    create_table :road_blocks do |t|
      t.string :name
      t.string :lat
      t.string :log
      t.string :address
      t.datetime :start_date
      t.datetime :end_time
    end

    create_table :traffic_incidents do |t|
      t.string :name
      t.string :lat
      t.string :lon
      t.string :address
      t.text :description
    end

  end

end
