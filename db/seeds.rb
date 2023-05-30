# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
puts "== Seeding the database with fixtures =="
Rails.logger = Logger.new $stdout
ENV["FIXTURES_PATH"] = "spec/fixtures"
Rake::Task["db:fixtures:load"].invoke
puts "== Database successfuly seeded =="
