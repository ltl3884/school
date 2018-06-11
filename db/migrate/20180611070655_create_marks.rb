class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.string :xiaoqu
      t.integer :rate
      t.text :remark

      t.timestamps null: false
    end
  end
end
