class CreateSections < ActiveRecord::Migration
  def change
    create_table :sections do |t|
      t.integer :tournament_id
      t.integer :event_id
      t.integer :min_age
      t.integer :max_age
      t.boolean :active

      t.timestamps
    end
  end
end
