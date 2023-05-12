# == Schema Information
#
# Table name: patients
#
#  id           :integer          not null, primary key
#  dob          :date
#  first_name   :string
#  last_name    :string
#  phone_number :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Patient < ApplicationRecord
  has_many(:visits, { :class_name => "Visit", :foreign_key => "patient_id" })
end
