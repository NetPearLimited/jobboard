Rails.application.routes.draw do
  resources :jobs
  resources :categories

  
  devise_for :users, path: 'users', controllers: {
  sessions: 'users/sessions',
  registrations: 'users/registrations'
}

devise_for :admins, path: 'admins', controllers: {
  sessions: 'admins/sessions',
  registrations: 'admins/registrations'
}

devise_scope :user do
  authenticated :user do
    namespace :users do
      get 'buyersdash/buyerdash', as: :authenticated_root
    end
  end
end

devise_scope :admin do
  authenticated :admin do
    namespace :admins do
      get 'dashboard/index', as: :authenticated_root
      
    end
  end
end

get 'jobs/index'
 get 'users/sellersdash/sellerdash'
#get 'users/sellersdash/sellersdash', action: :sellerdash, controller: 'users'
#get 'users/sellersdash/sellerdash', to: 'users#sellersdash#sellerdash'

root to: 'pages#landing'
#get "/get_subcategories" => "jobs#get_subcategories"
#get 'jobs/partial/subcategories'
#get 'jobs/partial/subcategories' => 'jobs#get_subcategories'
#get "/get_subcategories" => "jobs#get_subcategories"
#get "/get_subsubcategories" => "jobs#get_subsubcategories"

#get"/jobs", to: "jobs#category"
 

end


