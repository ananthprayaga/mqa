# == Schema Information
#
# Table name: visits
#
#  id                :integer          not null, primary key
#  date_of_visit     :date
#  description       :text
#  keywords          :text
#  medical_specialty :string
#  transcription     :text
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  doctor_id         :integer
#  patient_id        :integer
#
class Visit < ApplicationRecord
  belongs_to(:patient, { :required => true, :class_name => "Patient", :foreign_key => "patient_id", :counter_cache => true })
  belongs_to(:doctor, { :required => true, :class_name => "Doctor", :foreign_key => "doctor_id", :counter_cache => true })
end
