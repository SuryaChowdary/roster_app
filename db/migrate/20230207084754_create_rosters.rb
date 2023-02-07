class CreateRosters < ActiveRecord::Migration[7.0]
  def change
    create_table :rosters do |t|
      t.date :roster_date
      t.references :company, foreign_key: true, null: false
      t.timestamps
    end
  end
end
