Rails.application.routes.draw do
# Users controller routes
  get("/", { :controller => "users", :action => "index" })
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:username", { :controller => "users", :action => "show" })
  post("/insert_user_record", { :controller => "users", :action => "create" })
  post("/update_user/:user_id", { :controller => "users", :action => "update" })


#Venues controller routes
  get("/venues", { :controller => "venues", :action => "index" })
  post("/insert_venue_record", { :controller => "venues", :action => "create" })
  get("/venues/:path_id", { :controller => "venues", :action => "show" })
  post("/update_venue/:the_id", { :controller => "application", :action => "update" })
  get("/delete_venue/:id_to_delete", { :controller => "venues", :action => "destroy" })
  
  post("/insert_comment_record", { :controller => "comments", :action => "create" })
end
