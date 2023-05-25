# == Schema Information
#
# Table name: qas
#
#  id         :integer          not null, primary key
#  answer     :string
#  question   :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  visit_id   :integer
#
class Qa < ApplicationRecord
  belongs_to(:visit, { :required => true, :class_name => "Visit", :foreign_key => "visit_id" })
end
