module Api
  module V1
    module Admin
      class BooksController < API::V1::ADMIN::AdminBaseController

        def get_books
          render json: { books: Book.all }
        end

        def get_book
          required(params, :id)
          book = Book.find(params[:id])
          render json: { book: book }
        end

        def add_book
          required(params, :name, :isbn13, :cover_type, :language, :publisher, :published_year, :genre, :category)
          resp = Book.new_entry(params)
          render json: { response: resp }
        end
      end
    end
  end
end
