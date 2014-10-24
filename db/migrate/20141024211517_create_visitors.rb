class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string :ip
      t.string :cookie_id

      t.timestamps
    end
  end
end
