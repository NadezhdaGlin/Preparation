FactoryBot.define do
  factory :member do
    surname { "Smith" }
    firstname { "Darren" }
    address { "8 Bloomsbury Close, Boston" }
    zipcode { 4321 }
    telephone { "555-555-5555" }
    recommendedby { 4 }
    joindate { "2023-03-04 17:44:52" }
  end
end
