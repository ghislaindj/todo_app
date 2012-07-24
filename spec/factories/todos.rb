# Read about factories at http://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :todo do
    title "MyString"
    body "MyText"
    done false
    due "2012-07-24 10:08:07"
  end
end
