class Book < ActiveRecord::Base
  has_many :author_books
  has_many :authors, :through => :author_books
  has_and_belongs_to_many :libraries, join_table: :collections

  def self.new_entry(params)
    attr_list = [:name, :isbn13, :cover_type, :language, :publisher, :published_year, :genre, :category]
    if params.to_a.empty? or (attr_list.map {|attr| params[attr] }.compact.count <  attr_list.count)
      return nil, "All parameters need to be given"
    else
      Book.create(params)
      return true, "Book #{params[:name]} created!"
    end
  end

  def self.add_author(params)
    attr_list = [:book_name, :author_first_name, :author_last_name]
    if params.to_a.empty? or (attr_list.map {|attr| params[attr] }.compact.count <  attr_list.count)
      return nil, "All parameters need to be given"
    else
      book = Book.find_by_name(params[:book_name])
      author_params = Hash[[:first_name, :last_name, :country_of_origin, :mini_bio, :wiki_link].map{ |attr| [attr, params[(:author_.to_s + attr.to_s).to_sym]] }]
      if book
        author = Author.find_or_create_by(author_params)
        book.authors << author
      end
    end
  end

end
