%w[helpers config pages].each do |dir|
  Dir[Rails.root.join("spec/support/#{dir}/**/*.rb")].sort.each { |file| require file }
end
