FactoryGirl.define do
  factory :institution do
    title { Faker::Name.name }
    subdomain { Faker::Internet.domain_word }
    address { Faker::Address.street_address }
    state 'Distrito Federal'
    municipality 'Cuauhtemoc'
    phone { Faker::PhoneNumber.phone_number }
    cct '01DBP0002T'
    education_level "básico"
    category "técnica"
  end
end
