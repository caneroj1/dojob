FactoryGirl.define do
  factory :certification do |f|
    f.title           { "#{Faker::Company.name} Certification" }
    f.acquired        { Time.now }
    f.expires         { Faker::Date.forward(30) }
    f.link            { Faker::Internet.url }
    f.certifying_body { Faker::Company.name }
    f.user_id         { rand(1000) }

    factory :invalid_certification do |f|
      f.acquired        { 1 }
      f.expires         { 1 }
    end
  end
end
