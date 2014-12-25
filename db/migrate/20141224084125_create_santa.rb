class CreateSanta < ActiveRecord::Migration
  def change
    create_table :santa do |t|
      t.string :name
      t.timestamps
    end
  end
end
