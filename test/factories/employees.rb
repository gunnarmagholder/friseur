# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :employee do
    name "Cornelia Cutexperte"
    password "secret"
    password_confirmation "secret"
    sequence(:email) {|i| "employee#{i}@tester.de" }
    telephone "04040194676"
  end
end
