# == Schema Information
#
# Table name: patients
#
#  id           :integer          not null, primary key
#  dob          :date
#  first_name   :string
#  last_name    :string
#  phone_number :string
#  visits_count :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Patient < ApplicationRecord
end
