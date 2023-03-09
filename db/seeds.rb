# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# doctors dummy sample data
Doctor.create(
  name: "Rebecca Wong", 
  email: "dr.rebecca.wong@gmail.com", 
  specialization: " Cardiologist", 
  picture: "https://images.theconversation.com/files/304957/original/file-20191203-66986-im7o5.jpg?ixlib=rb-1.1.0&q=45&auto=format&w=926&fit=clip"
)

Doctor.create(
  name: "Mohammed Ali", 
  email: "dr.mohammed.ali@gmail.com", 
  specialization: "Neurologist", 
  picture: "https://hips.hearstapps.com/hmg-prod/images/portrait-of-a-happy-young-doctor-in-his-clinic-royalty-free-image-1661432441.jpg?crop=0.66698xw:1xh;center,top&resize=1200:*"
)

Doctor.create(
  name: "Olivia Davis", 
  email: "dr.olivia.davis@gmail.com", 
  specialization: "Dermatologist", 
  picture: "https://www.yourfreecareertest.com/wp-content/uploads/2018/01/how_to_become_a_doctor-300x200.jpg"
)

Doctor.create(
  name: "Ethan Lee", 
  email: "dr.ethan.lee@gmail.com", 
  specialization: " Pediatrician", 
  picture: "https://royalphnompenhhospital.com/royalpp/storage/app/uploads/2/2022-06-30/dr_sarisak_01.jpg"
)

Doctor.create(
  name: "Sophia Patel", 
  email: "dr.sophia.patel@gmail.com", 
  specialization: " Psychiatrist", 
  picture: "https://www.phoenixmag.com/wp-content/uploads/2022/03/PHM0422TD17-1200x800.jpg"
)

