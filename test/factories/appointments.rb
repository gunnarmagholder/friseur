# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :appointment do
    app_date "2012-04-17"
    app_time "15:00"
    customer_id 0
    product_id 1
    notes "MyText"
    confirmed false
    telephone "04040194676"
    email nil
    custname "Hr. Muster"
    calendar
  end
end
