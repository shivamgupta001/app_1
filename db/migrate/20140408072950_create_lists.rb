class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name
      t.date :s_date
      t.date :e_date

      t.timestamps
    end
  end
end
