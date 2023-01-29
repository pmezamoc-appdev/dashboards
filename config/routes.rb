Rails.application.routes.draw do
  get("/", {:controller => "application", :action => "launch"})
  get("/rates", {:controller => "application", :action => "list"})

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
