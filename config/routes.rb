Rails.application.routes.draw do

  namespace :api do
    namespace :v1 do

      resources :reservations, only: [:index, :create] do
        collection do 
          patch :update
        end
      end

    end
  end

end
