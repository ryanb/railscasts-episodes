FactoryGirl.define do
  factory :user do
    sequence(:username) { |n| "foo#{n}" }
    password "foobar"
    email { "#{username}@example.com" }
    admin false
    
    factory :admin do
      admin true
    end
  end
  
  factory :article do
    name "Foo"
    user
  end
end
