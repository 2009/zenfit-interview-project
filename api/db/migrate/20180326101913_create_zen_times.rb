class CreateZenTimes < ActiveRecord::Migration[5.1]
  def change
    create_table :zen_times do |t|
      t.date :date
      t.integer :time
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
