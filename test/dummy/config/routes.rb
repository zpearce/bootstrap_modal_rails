BootstrapModalTest::Application.routes.draw do
  get "dashboard/index"
  get "dashboard/new"
  root :to => "dashboard#index"
end
