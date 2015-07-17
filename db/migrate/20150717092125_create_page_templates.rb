class CreatePageTemplates < ActiveRecord::Migration
  def change
    create_table :page_templates do |t|
      t.text :page_header
      t.text :page_body
      t.text :page_footer
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
