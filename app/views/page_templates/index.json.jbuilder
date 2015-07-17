json.array!(@page_templates) do |page_template|
  json.extract! page_template, :id, :page_header, :page_body, :page_footer, :user_id
  json.url page_template_url(page_template, format: :json)
end
