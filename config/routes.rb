Rails.application.routes.draw do
  api_version(:module => "API::V1", :path => {:value => "v1"}, :default => true) do
    namespace :admin do
      resources :books do
        collection do
          get 'get_books'
          get 'get_book'
          post 'add_book'
          get 'find_books'
        end
      end

      resources :authors do
        collection do
          get 'get_all_authors'
          post 'add_author'
        end
      end

      resources :library do
        collection do
          post 'add_library'
        end
      end

    end
  end
end
