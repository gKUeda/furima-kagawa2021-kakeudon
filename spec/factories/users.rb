FactoryBot.define do
  factory :user do    
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {"123abc"}
    password_confirmation {"123abc"}
    lastname              {"山田"}
    firstname             {"太郎"}
    lastname_kana         {"ヤマダ"}
    firstname_kana        {"タロウ"}
    birth_date            {Faker::Date.birthday}
  end
end