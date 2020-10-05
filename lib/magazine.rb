require_relative 'csv_parser'

class Magazine
	extend CsvParser

	ATTR_LIST = %w(title isbn authors publishedat).freeze
	DATA_PATH = "data/magazines.csv"
	@@magazines = []

	attr_accessor :title, :isbn, :publishedat, :authors

	def initialize(attrs)
		@title = attrs[:title]
		@isbn = attrs[:isbn]
		@publishedat = attrs[:publishedat]
		@authors = Author.get_authors_by_email(attrs[:authors])
	end

	def print_details
		puts "------------------------------------"
		puts "Magazine Title: #{title}"
		puts "ISBN: #{isbn}"
		puts "Written by: #{authors.map(&:full_name).join(',')}"
		puts "Published At: #{publishedat}"
		puts "------------------------------------"
	end
end