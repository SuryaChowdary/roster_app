class CreateShifts < ActiveRecord::Migration[7.0]
  def change
    create_table :shifts do |t|
      t.time :start_time
      t.time :end_time
      t.references :user, foreign_key: true, null: false
      t.references :roster, foreign_key: true, null: false
      t.timestamps
    end
  end
end
