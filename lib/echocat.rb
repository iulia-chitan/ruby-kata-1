# frozen_string_literal: true
require_relative 'author'
require_relative 'book'
require_relative 'magazine'

module Echocat
  def self.run
    build_data
    print_data
  end

  def self.build_data
  	Author.build_data
  	Book.build_data
  	Magazine.build_data
  end

  def self.print_data
  	resources = all_resources
  	resources.sort_by { |resource| resource.title }.each do |resource|
  		resource.print_details
  	end
  end

  def self.all_resources
  	Book.class_variable_get(:@@books) + Magazine.class_variable_get(:@@magazines)
  end

  def self.find_by_isbn(isbn)
  	resources = all_resources
  	resources.select { |resource| resource.isbn == isbn }
  end

  def self.find_by_email(email)
  	resources = all_resources
  	resources.select { |resource| resource.authors.map(&:email).include?(email) }
  end
end
