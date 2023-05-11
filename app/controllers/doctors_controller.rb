class DoctorsController < ApplicationController
  def index
    matching_doctors = Doctor.all

    @list_of_doctors = matching_doctors.order({ :created_at => :desc })

    render({ :template => "doctors/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_doctors = Doctor.where({ :id => the_id })

    @the_doctor = matching_doctors.at(0)

    render({ :template => "doctors/show.html.erb" })
  end

  def create
    the_doctor = Doctor.new
    the_doctor.first_name = params.fetch("query_first_name")
    the_doctor.last_name = params.fetch("query_last_name")
    the_doctor.visits_count = params.fetch("query_visits_count")

    if the_doctor.valid?
      the_doctor.save
      redirect_to("/doctors", { :notice => "Doctor created successfully." })
    else
      redirect_to("/doctors", { :alert => the_doctor.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_doctor = Doctor.where({ :id => the_id }).at(0)

    the_doctor.first_name = params.fetch("query_first_name")
    the_doctor.last_name = params.fetch("query_last_name")
    the_doctor.visits_count = params.fetch("query_visits_count")

    if the_doctor.valid?
      the_doctor.save
      redirect_to("/doctors/#{the_doctor.id}", { :notice => "Doctor updated successfully."} )
    else
      redirect_to("/doctors/#{the_doctor.id}", { :alert => the_doctor.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_doctor = Doctor.where({ :id => the_id }).at(0)

    the_doctor.destroy

    redirect_to("/doctors", { :notice => "Doctor deleted successfully."} )
  end
end
