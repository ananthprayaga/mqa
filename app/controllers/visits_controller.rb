class VisitsController < ApplicationController
  def index
    matching_visits = Visit.all

    @list_of_visits = matching_visits.order({ :created_at => :desc })

    render({ :template => "visits/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_visits = Visit.where({ :id => the_id })

    @the_visit = matching_visits.at(0)

    render({ :template => "visits/show.html.erb" })
  end

  def create
    the_visit = Visit.new
    the_visit.date_of_visit = params.fetch("query_date_of_visit")
    the_visit.patient_id = params.fetch("query_patient_id")
    the_visit.description = params.fetch("query_description")
    the_visit.medical_specialty = params.fetch("query_medical_specialty")
    the_visit.transcription = params.fetch("query_transcription")
    the_visit.keywords = params.fetch("query_keywords")
    the_visit.doctor_id = params.fetch("query_doctor_id")

    if the_visit.valid?
      the_visit.save
      redirect_to("/visits", { :notice => "Visit created successfully." })
    else
      redirect_to("/visits", { :alert => the_visit.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_visit = Visit.where({ :id => the_id }).at(0)

    the_visit.date_of_visit = params.fetch("query_date_of_visit")
    the_visit.patient_id = params.fetch("query_patient_id")
    the_visit.description = params.fetch("query_description")
    the_visit.medical_specialty = params.fetch("query_medical_specialty")
    the_visit.transcription = params.fetch("query_transcription")
    the_visit.keywords = params.fetch("query_keywords")
    the_visit.doctor_id = params.fetch("query_doctor_id")

    if the_visit.valid?
      the_visit.save
      redirect_to("/visits/#{the_visit.id}", { :notice => "Visit updated successfully."} )
    else
      redirect_to("/visits/#{the_visit.id}", { :alert => the_visit.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_visit = Visit.where({ :id => the_id }).at(0)

    the_visit.destroy

    redirect_to("/visits", { :notice => "Visit deleted successfully."} )
  end
end
