class CreateCandidates < ActiveRecord::Migration
  def change
    create_table :candidates do |t|
      t.string :name
      t.string :sex
      t.string :university

      t.timestamps
    end
  end
end
