class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.time :open_at
      t.time :close_at
      t.string :weekday
      t.boolean :closed
      t.boolean :multiple_slots
      t.time :open_at_ms
      t.time :close_at_ms
      t.references :shop, null: false, foreign_key: true

      t.timestamps
    end
  end
end
