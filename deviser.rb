#!/usr/bin/env ruby

require 'readline'

require ::File.expand_path('../config/environment',  __FILE__)

require 'application_controller'

class ApplicationController
  prepend_around_filter do
    sign_in $resource, bypass: true
  end
end

class String
  def gray
    "\e[90m#{self}\e[0m"
  end

  def red
    "\e[91m#{self}\e[0m"
  end
end

def key
  Rails.configuration.session_options[:key]
end

def cookie
  session = ActionDispatch::Integration::Session.new(Rails.application)
  session.https!
  session.get('/')
  session.cookies[key]
end

puts 'Provide Deviser with an authenticatable resource to impersonate.'
puts 'Use Ruby (e.g. User.first) in the following prompt:'

loop do
  begin
    input = Readline.readline("\n> ", true)

    # Exit cleanly when ^D is pressed
    # See: http://ruby-doc.org/stdlib-2.2.2/libdoc/readline/rdoc/Readline.html#method-c-readline
    unless input
      puts
      exit
    end

    $resource = eval(input)
    puts $resource.inspect.gray
    unless $resource.respond_to? :active_for_authentication?
      raise 'That does not seem like an authenticatable resource :('.red
    end

    session_key = cookie

    puts
    puts "For cookie '#{key}' use the following session key:"
    puts

    puts session_key
    puts
  rescue SyntaxError, StandardError => e
    puts "#{e.class.name}: #{e.message}".red
  end
end
