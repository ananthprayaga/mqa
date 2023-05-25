desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do
  Patient.destroy_all
  Doctor.destroy_all
  Visit.destroy_all

  50.times do
    require "faker"
    patient = Patient.new
    patient.first_name = Faker::Name.first_name
    patient.last_name = Faker::Name.last_name
    patient.dob = Faker::Date.between(from: "1950-01-01", to: "2014-09-25")
    patient.phone_number = Faker::PhoneNumber.cell_phone
    patient.save
  end

  10.times do
    require "faker"
    doctor = Doctor.new
    doctor.first_name = Faker::Name.first_name
    doctor.last_name = Faker::Name.last_name
    doctor.save
  end

  require "csv"
  require "faker"
  csv_text = File.read(Rails.root.join("lib", "csvs", "mtsamples.csv"))
  csv = CSV.parse(csv_text, :headers => true)
  csv.each do |row|
    v = Visit.new
    v.date_of_visit = Faker::Date.between(from: "2020-01-01", to: "2023-04-25")
    v.description = row["description"]
    v.keywords = row["keywords"]
    v.medical_specialty = row["medical_specialty"]
    v.transcription = row["transcription"]
    v.doctor_id = Doctor.all.sample.id
    v.patient_id = Patient.all.sample.id
    v.save
  end

  p "Added #{Patient.count} Patients"
  p "Added #{Doctor.count} Doctors"
  p "Added #{Visit.count} Visits"
end
