class CreateFancyVotes < ActiveRecord::Migration
  def change
    create_table :fancy_votes do |t|
      t.integer :candidate_id
      t.integer :visitor_id

      t.timestamps
    end
  end
end
