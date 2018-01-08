Rails.application.routes.draw do

  get 'prices/show'

  get 'prices/update'

  get 'errors/show'



  get 'features/index'

  get 'features/new'

  post 'features/create'

  get 'features/edit'

  get 'features/delete'

  post 'features/add'

  

  get 'seats/index'

  post 'seats/create'

  get 'seats/create'
  
  get 'seats/new'

  get 'seats/edit'

  get 'seats/delete'




  get 'flights/create'

  post 'flights/create'

  get 'flights/delete'

  get 'flights/show'

  get 'flights/new'


=begin

  resources :airline_admin do
    member do
      get :delete
    end 
  end
=end

  get 'airline_manager/index'

  post 'airline_manager/index'

  get 'airline_manager/update'

  post 'airline_manager/update'

  get 'airline_manager/price'

  get 'airline_manager/destroy'

  get 'airline_manager/edit'

  get 'airline_manager/approve'


  get 'airline_admin/index'

  post 'airline_admin/index'

  get 'airline_admin/create'

  post 'airline_admin/create'

  get 'airline_admin/update'

  get 'airline_admin/destroy'




  get 'static_pages/home'

  get 'static_pages/book'

  get 'static_pages/search'

  post 'static_pages/search'

  get 'static_pages/itinerary'

  post 'static_pages/itinerary'

  get 'static_pages/info'

  post 'static_pages/create'

  get 'static_pages/features'

  get 'airline_manager/price'

  get 'static_pages/about'

  get 'static_pages/help'

  get 'static_pages/contact'




  #-----------------APi ROUTES----------------------------

  namespace :api do
    namespace :v1 do
      resources :flighter, only: [:index, :show, :search]
      get ':source/:destination' => 'flighter#search'
      get ':id/:date'            => 'flighter#seats'
      
      match "/id/date" => "flighter#seats",  :via => [:get], :as => 'gallery_show'
      match "/id/date" => "flighter#seats", :via => [:get], :defaults => { :status => 'date' }

    end
  end



  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
