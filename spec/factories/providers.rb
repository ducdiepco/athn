FactoryBot.define do
  factory :provider do
    first_name { 'first' }
    last_name { 'last' }
    office_address { '4 Lakeland Junction' }
    office_city { 'Irvine' }
    office_state { 'California' }
  end
end
