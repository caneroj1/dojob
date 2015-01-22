FactoryGirl.define do
  factory :user do |f|
    f.first_name  { Faker::Name.first_name }
    f.last_name   { Faker::Name.last_name }
    f.state       { Faker::Address.state }
    f.city        { Faker::Address.city }
    f.zip         { zip = ""; 5.times { zip  << rand(9).to_s }; zip; }
    f.address     { Faker::Address.street_name }
    f.email       { Faker::Internet.email }
    f.password    { Faker::Internet.password(10) }

    factory :user_with_certifications do
      after(:create) do |user|
        user.certifications << FactoryGirl.create(:certification)
      end
    end
  end
end
