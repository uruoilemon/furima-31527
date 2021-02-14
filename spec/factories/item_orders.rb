FactoryBot.define do
  factory :item_order do
    postal_code { '123-4567' }
    prefecture { 16 }
    city { '村上市' }
    address {'111'}
    building { '東京ハイツ' }
    phone_number {'09011111111'}
    token {"tok_abcdefghijk00000000000000000"}
  end
end
