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
      redirect_to("/visits/#{the_visit.id}", { :notice => "Visit updated successfully." })
    else
      redirect_to("/visits/#{the_visit.id}", { :alert => the_visit.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_visit = Visit.where({ :id => the_id }).at(0)

    the_visit.destroy

    redirect_to("/visits", { :notice => "Visit deleted successfully." })
  end

  def chat
    current_visit_id = params.fetch("visit_id")
    @the_visit = Visit.where({ :id => current_visit_id }).at(0)
    @the_patient = Patient.where({ :id => @the_visit.patient_id }).at(0)
    @list_of_questions = Qa.all.where({ :visit_id => current_visit_id })

    render({ :template => "visits/chat.html.erb" })
  end

  def answer
    current_visit_id = params.fetch("visit_id")

    @the_visit = Visit.where({ :id => current_visit_id }).at(0)

    @the_patient = Patient.where({ :id => @the_visit.patient_id }).at(0)

    @question = params.fetch("question")

    request_content = "#{@the_visit.description} The patient name is #{@the_patient.first_name} #{@the_patient.last_name}. The notes during the visit are: #{@the_visit.transcription}"

    # Need to add this later into the Visit reason: #{@the_visit.sample}

    openai_client = OpenAI::Client.new(
      access_token: ENV.fetch("OPENAI_ACCESS_TOKEN"),
      request_timeout: 240, # Optional parameter; increases the number of seconds before a request times out
    )

    response_three_five = openai_client.chat(
      parameters: {
        model: "gpt-3.5-turbo", # Required. I recommend using gpt-3.5-turbo while developing, because it's a LOT cheaper than gpt-4
        messages: [
          { role: "system", content: request_content },
          { role: "user", content: @question },
        ],
        temperature: 0.1,
      },
    )

    @message_response_threefive = response_three_five.fetch("choices").at(0).fetch("message").fetch("content")

    new_qa = Qa.new
    new_qa.question = @question
    new_qa.answer = @message_response_threefive
    new_qa.visit_id = current_visit_id
    new_qa.save

    @list_of_questions = Qa.all.where({ :visit_id => current_visit_id })

    render({ :template => "visits/answer.html.erb" })
  end
end
