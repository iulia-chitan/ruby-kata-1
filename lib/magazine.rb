require_relative 'csv_parser'

class Magazine
	extend CsvParser

	ATTR_LIST = %w(title isbn publishedAt authors).freeze
	DATA_PATH = "data/books.csv"
	@@magazines = []

	attr_accessor :title, :isbn, :publishedAt, :authors

	def initialize(attrs)
		@title = attrs[:title]
		@isbn = attrs[:isbn]
		@description = attrs[:publishedAt]
		@authors = Author.get_authors_by_email(attrs[:authors])
	end

	def print_details
		puts "Magazine Title: #{title}, ISBN: #{isbn}"
		puts "Written by: #{authors.map(&:full_name).join(',')}"
		puts "Published At: #{publishedAt}"
	end
end