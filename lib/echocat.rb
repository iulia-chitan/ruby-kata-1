# frozen_string_literal: true
require_relative 'author'
require_relative 'book'
require_relative 'magazine'

module Echocat
  def self.run
    build_data
    welcome
  end

  def self.build_data
  	Author.build_data
  	Book.build_data
  	Magazine.build_data
  end

  def self.welcome
    puts "What would you like to do?"
    puts "You can print data using display command or you can search for resources using search command"
    puts "If you want to exit the program, please print stop"
    method = gets.strip
    
    return if method == "stop"

    send(method)
  end

  def self.display
  	resources = all_resources
  	resources.sort_by { |resource| resource.title }.each do |resource|
  		resource.print_details
  	end

    welcome
  end

  def self.search
    puts "You can search for resources by isbn or email"
    search_by = gets.strip
    method = "find_by_#{search_by}"
    send(method)
    welcome 
  end

  def self.method_missing(_meth)
    puts "I don't know how to do this"
    puts "Would you want to try something else?"
    answer = gets.strip

    welcome if answer == "yes"
    return
  end

  def self.all_resources
  	Book.class_variable_get(:@@books) + Magazine.class_variable_get(:@@magazines)
  end

  def self.find_by_isbn
    puts "Please enter the isbn"
    isbn = gets.strip
  	resources = all_resources
  	resources.select { |resource| resource.isbn == isbn }
             .each { |res| res.print_details }
  end

  def self.find_by_email
    puts "Please enter the email address"
    email = gets.strip
  	resources = all_resources
  	resources.select { |resource| resource.authors.map(&:email).include?(email) }
             .each { |res| res.print_details }
  end
end
