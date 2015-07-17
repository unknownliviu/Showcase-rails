class AddTitleToPageTemplates < ActiveRecord::Migration
  def change
    add_column :page_templates, :title, :string
  end
end
