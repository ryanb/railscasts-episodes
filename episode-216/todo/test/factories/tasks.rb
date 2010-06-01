# Read about factories at http://github.com/thoughtbot/factory_girl

Factory.define :task do |f|
  f.project_id 1
  f.name "MyString"
end
