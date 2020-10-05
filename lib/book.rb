require_relative 'csv_parser'
require_relative 'author'

class Book
	extend CsvParser
	@@books = []
	ATTR_LIST = %w(title isbn description authors).freeze
	DATA_PATH = "data/books.csv"

	attr_accessor :title, :isbn, :description, :authors

	
	def initialize(attrs)
		@title = attrs[:title]
		@isbn = attrs[:isbn]
		@description = attrs[:description]
		@authors = Author.get_authors_by_email(attrs[:authors])
	end

	def print_details
		puts "Book Title: #{title}, ISBN: #{isbn}"
		puts "Written by: #{authors.map(&:full_name).join(',')}"
		puts "Description: #{description}"
	end
end