
FactoryGirl.define do
  factory :piano, :class => Refinery::Pianos::Piano do
    sequence(:name) { |n| "refinery#{n}" }
  end
end

