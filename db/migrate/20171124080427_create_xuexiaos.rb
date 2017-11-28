class CreateXuexiaos < ActiveRecord::Migration
  def change
    create_table :xuexiaos do |t|
    	t.string :name
    	t.string :l_name
    	t.string :l_lat
    	t.string :l_lng
    	t.string :l_address
    	t.integer :level #一流一类 11,一流二类 12,二流一类 21,二流二类 22
    	t.string :area
      t.timestamps null: false
    end
  end
end
