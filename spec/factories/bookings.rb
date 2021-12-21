FactoryBot.define do
  factory :booking do
    name { "test user" }
    email { "testuser1@mail.com" }
    mobile { "9999999999" }
    booking_date { "2021/12/20" }
    from_time { "12:00:00" }
    to_time { "14:00:00" }

    factory :booked do
      status { 1 }
    end

    factory :unbooked do
      status { 0 }
    end
  end

end
