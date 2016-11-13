Rails.application.routes.draw do
  api_version(:module => "API::V1", :path => {:value => "v1"}, :default => true) do
    namespace :admin do
      resources :books do
        collection do
          get 'get_books'
          get 'get_book'
        end
      end
    end

  end


end
