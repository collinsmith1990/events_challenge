class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :start
      t.datetime :finish
      t.string   :name
      t.string   :track

      t.timestamps
    end
  end
end
