FactoryGirl.define do
  factory :customer do
    name "Bettina Bretthaar"
    password "secret"
    password_confirmation "secret"
    sequence(:email) {|i| "test#{i}@tester.de" }
    telephone "04040194676"
    street "Holtkoppel 27"
    zipcode "20223"
    sex true
    dob "12.03.1969"
  end
end