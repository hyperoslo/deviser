#!/usr/bin/env ruby

require 'readline'

require ::File.expand_path('../config/environment',  __FILE__)

puts 'Provide Deviser with an authenticatable resource to impersonate.'
puts 'Use Ruby (e.g. User.first) in the following prompt:'

loop do
  begin
    input = Readline.readline("\n> ", true)
    $resource = eval(input)
    unless $resource.respond_to? :active_for_authentication?
      raise 'That does not seem like an authenticatable resource :('
    end
    break
  rescue SyntaxError, StandardError => e
    puts "#{e.class.name}: #{e.message}"
  end
end

require 'application_controller'

class ApplicationController
  prepend_around_filter do
    sign_in $resource, bypass: true
  end
end

session = ActionDispatch::Integration::Session.new(Rails.application)
session.get('/')

key = Rails.configuration.session_options[:key]

puts
puts "For cookie '#{key}' use the following session key:"
puts

puts session.cookies[key]
