Rails.application.routes.draw do



  # Routes for the Patient resource:

  # CREATE
  post("/insert_patient", { :controller => "patients", :action => "create" })
          
  # READ
  get("/patients", { :controller => "patients", :action => "index" })
  
  get("/patients/:path_id", { :controller => "patients", :action => "show" })
  
  # UPDATE
  
  post("/modify_patient/:path_id", { :controller => "patients", :action => "update" })
  
  # DELETE
  get("/delete_patient/:path_id", { :controller => "patients", :action => "destroy" })

  #------------------------------

end
