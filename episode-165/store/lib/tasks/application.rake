desc "Setup all for app"
task :setup => ['db:migrate', 'load:categories', 'load:products']

namespace :load do
  desc "Load categories into database"
  task :categories do
    Category.delete_all
    ['Electronics', 'Office Supplies', 'Toys', 'Clothing', 'Groceries'].each do |name|
      Category.create!(:name => name)
    end
  end
  
  desc "Load products into database"
  task :products do
    Product.delete_all
    categories = Category.all
    words = File.readlines("/usr/share/dict/words").sort_by { rand }
    lorem = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    25.times do
      Product.create!(:name => words.pop.titleize, :category => categories.rand, :description => lorem, :price => [4.99, 9.99, 14.99, 19.99, 29.99].rand)
    end
  end
end
