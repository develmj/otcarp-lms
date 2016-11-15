module Api
  module V1
    module Admin
      class LibraryController < API::V1::ADMIN::AdminBaseController

        def add_library
          required(params, :name, :address, :city, :state, :country)
        end

      end
    end
  end
end
