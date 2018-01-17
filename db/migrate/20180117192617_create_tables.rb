class CreateTables < ActiveRecord::Migration[5.0]
  def change
    create_table :tables do |t|
      t.integer :host_id
      t.string :table_name
      t.date :table_date
      t.time :table_time
      t.integer :number_of_seats

      t.timestamps
    end
  end
end
