class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.string :message
      t.belongs_to :santa, index: true, null: false
      t.timestamps
    end
    
  end
end
