# # https://github.com/duleorlovic/rails_helpers_and_const/blob/main/config/initializers/const.rb

# # For Rails::Server::Options.new.parse!(ARGV)[:Port] to work in c and sidekiq
# require "rails/commands" # we need this to sidekiq
# require "rails/commands/server/server_command" # we need this for rails c or rails g migration
# # there is an exception: uninitialized constant Rails::Server (NameError)
# # I tried with Rack::Server.new.options[:Port] but it always returns 9292

# module Const
#   def self.common # rubocop:todo Metrics/MethodLength
#     hash_or_error_if_key_does_not_exists(
#       name: "MyApp",
#       # short_name is also use in config/sidekiq.yml and config/application.rb
#       short_name: "myapp",
#       # default_url is required for links in email body or in links in controller
#       # when url host is not available (for example rails console)
#       # look below how default_url is used
#       default_url: {
#         host: if Rails.env.production?
#                 "www.myapp.com"
#               elsif Rails.env.development?
#                 "localhost"
#               else
#                 "127.0.0.1"
#               end,
#         port: (Rails.env.development? ? Rails::Server::Options.new.parse!(ARGV)[:Port] : nil),
#         protocol: Rails.env.production? ? "https" : "http"
#       }
#     )
#   end

#   def self.hash_or_error_if_key_does_not_exists(hash)
#     # https://stackoverflow.com/questions/30528699/why-isnt-an-exception-thrown-when-the-hash-value-doesnt-exist
#     # raise if key does not exists hash[:non_exists] or hash.values_at[:non_exists]
#     hash.default_proc = ->(_h, k) { raise KeyError, "#{k} not found!" }
#     # raise when value not exists hash.key 'non_exists'
#     def hash.key(value)
#       k = super
#       raise KeyError, "#{value} not found!" unless k

#       k
#     end
#     hash
#   end

#   # https://stackoverflow.com/a/21249623/287166
#   class ConstRailtie < Rails::Railtie
#     link = Const.common[:default_url].symbolize_keys
#     # for link urls in emails
#     config.action_mailer.default_url_options = link
#     # Set host for rails console:
#     config.after_initialize do
#       # image upload does not work since port can not be determined, so I will
#       # skip setting default_url_options
#       # Rails.application.routes.default_url_options[:host] = link[:host]
#       Rails.application.routes.default_url_options = link
#     end
#     # for asset-url or img_tag in emails
#     config.action_mailer.asset_host = if link[:port]
#       "http://#{link[:host]}:#{link[:port]}"
#     else
#       "https://#{link[:host]}"
#     end
#     config.active_job.queue_name_prefix = Const.common[:short_name]
#   end
# end
