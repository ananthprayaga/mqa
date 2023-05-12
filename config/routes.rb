Rails.application.routes.draw do
  #Landing Page
  get("/", { :controller => "application", :action => "landing_page" })

  # Routes for the User account:

  # SIGN UP FORM
  get("/user_sign_up", { :controller => "user_authentication", :action => "sign_up_form" })
  # CREATE RECORD
  post("/insert_user", { :controller => "user_authentication", :action => "create" })

  # EDIT PROFILE FORM
  get("/edit_user_profile", { :controller => "user_authentication", :action => "edit_profile_form" })
  # UPDATE RECORD
  post("/modify_user", { :controller => "user_authentication", :action => "update" })

  # DELETE RECORD
  get("/cancel_user_account", { :controller => "user_authentication", :action => "destroy" })

  # ------------------------------

  # SIGN IN FORM
  get("/user_sign_in", { :controller => "user_authentication", :action => "sign_in_form" })
  # AUTHENTICATE AND STORE COOKIE
  post("/user_verify_credentials", { :controller => "user_authentication", :action => "create_cookie" })

  # SIGN OUT
  get("/user_sign_out", { :controller => "user_authentication", :action => "destroy_cookies" })

  #------------------------------

  # Routes for the Doctor resource:

  # CREATE
  post("/insert_doctor", { :controller => "doctors", :action => "create" })

  # READ
  get("/doctors", { :controller => "doctors", :action => "index" })

  get("/doctors/:path_id", { :controller => "doctors", :action => "show" })

  # UPDATE

  post("/modify_doctor/:path_id", { :controller => "doctors", :action => "update" })

  # DELETE
  get("/delete_doctor/:path_id", { :controller => "doctors", :action => "destroy" })

  #------------------------------

  # Routes for the Visit resource:

  # CREATE
  post("/insert_visit", { :controller => "visits", :action => "create" })

  # READ
  get("/visits", { :controller => "visits", :action => "index" })

  get("/visits/:path_id", { :controller => "visits", :action => "show" })

  # UPDATE

  post("/modify_visit/:path_id", { :controller => "visits", :action => "update" })

  # DELETE
  get("/delete_visit/:path_id", { :controller => "visits", :action => "destroy" })

  #------------------------------

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
