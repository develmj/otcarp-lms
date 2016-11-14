module Api
  module V1
    module Admin
      class BooksController < API::V1::ADMIN::AdminBaseController

        def get_all_books
          render json: { books: Book.all }
        end

        def get_book
          required(params, :id)
          resp = Book.find(params[:id])
          show_response(status: true, book: book)
        end

        def add_book
          required(params, :name, :isbn13, :cover_type, :language, :publisher, :published_year, :genre, :category, :author_first_name, :author_last_name)
          resp = Book.new_entry(params)
          show_response(resp)
        end

        def find_books
          resp = Book.find_books(params)
          render json: { response: resp }
        end

      end
    end
  end
end
