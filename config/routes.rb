Rails.application.routes.draw do
  get("/", {:controller => "application", :action => "launch"})
  get("/forex", {:controller => "application", :action => "list"})
  get("/forex/:symbol", {:controller => "application", :action => "convert"})
  get("/forex/:symbol_one/:symbol_two", {:controller => "application", :action => "values"})

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
