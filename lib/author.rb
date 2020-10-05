require_relative 'csv_parser'

class Author
	extend CsvParser
	@@authors = []
	DATA_PATH = "data/authors.csv"
	ATTR_LIST = %w(email firstname lastname).freeze

	attr_accessor :email, :firstname, :lastname
	
	def initialize(attrs)
		@email = attrs[:email]
		@firstname = attrs[:firstname]
		@lastname = attrs[:lastname]
	end

	def self.get_authors_by_email(emails_str)
		emails = emails_str.split(',')
		@@authors.select { |author| emails.include?(author.email) }
	end

	def full_name
		"#{firstname} #{lastname}"
	end
end