Then(/^I should see products table$/) do |expected_table|
  html_table = table_at("#products").to_a
  html_table.map! { |r| r.map! { |c| c.gsub(/<.+?>/, '') } }
  expected_table.diff!(html_table)
end
