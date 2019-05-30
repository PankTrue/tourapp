main_passport_get_by = ['МВД по пидорaшкe']
international_passport_get_by = main_passport_get_by

1000.times do
  Client.create( name: Faker::Name.first_name ,
                 surname: Faker::Name.last_name,
                 pantronymic: Faker::Name.first_name + 'ович',
                 gender: rand(2) ? 'Мужской' : 'Женский',
                 datebirth: rand(Date.civil(1950, 1, 1)..Date.civil(2000, 12, 31)),
                 phone: '+7' + rand.to_s[2..11],
                 email: Faker::Internet.email,
                 main_passport_series: rand(1000..9999),
                 main_passport_number: rand(1000000..999999),
                 main_passport_get_by: main_passport_get_by.sample,
                 main_passport_date_given: rand(Date.civil(1950, 1, 1)..Date.civil(2000, 12, 31)),
                 international_passport_series: rand(1000..9999),
                 international_passport_number: rand(1000000..999999),
                 international_passport_get_by: international_passport_get_by.sample,
                 international_passport_date_given: rand(Date.civil(1950, 1, 1)..Date.civil(2000, 12, 31)),
                 international_passport_date_end: rand(Date.civil(1950, 1, 1)..Date.civil(2000, 12, 31)),
                 user_id: 1
              )
end