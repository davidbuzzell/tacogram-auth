Rails.application.routes.draw do
  resources "posts"
  resources "sessions"
  resources "users"

  get("/login", {:controller => "sessions", :action => "new"})
  get("/logout", {:controller => "sessions", :action => "destroy"})

  get("/", {:controller => "posts", :action => "index"})
end
