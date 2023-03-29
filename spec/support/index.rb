%w[helpers config pages].each do |dir|
  Dir[Rails.root.join("spec/support/#{dir}/**/*.rb")].each { |file| require file }
end
