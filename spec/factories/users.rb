FactoryBot.define do
  factory :user do
    username { 'John' }
  end

  factory :doctor do
    name { 'Rebecca Wong' }
    email { 'dr.rebecca.wong@gmail.com' }
    specialization { 'Cardiologist' }
    picture { 'https://images.theconversation.com/files/304957/original/file-20191203-66986-im7o5.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=926&fit=clip' }
  end

  factory :reservation do
    doctor_id { 1 }
    user_id { 1 }
    date { Date.today }
    details { 'some details' }
  end
end
