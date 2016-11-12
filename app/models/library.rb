class Library < ActiveRecord::Base
  has_many :books, :through => :collections
  has_and_belongs_to_many :books, join_table: :collections
end
