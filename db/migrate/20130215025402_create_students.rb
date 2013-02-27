class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.integer :id
      t.string :name
      t.date :date
      t.integer :min_rank
      t.integer :max_rank
      t.boolean :active

      t.timestamps
    end
  end
end
