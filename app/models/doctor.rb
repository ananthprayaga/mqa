# == Schema Information
#
# Table name: doctors
#
#  id           :integer          not null, primary key
#  first_name   :string
#  last_name    :string
#  visits_count :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Doctor < ApplicationRecord
  has_many(:visits, { :class_name => "Visit", :foreign_key => "doctor_id" })
end
