# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :insurance do
    plan nil
    carrier_name "MyString"
    plan_name "MyString"
    policy_number "MyString"
    start_date "2012-06-12"
    renewal_date "2012-06-12"
    annual_premium 1.5
    comment "MyText"
  end
end
