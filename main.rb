require_relative './lib/config.rb'

Config.new do |app|
    app.name = "HelloMongo2"
    app.environment = :development
end

access = Access.new()


#Config::User.login = 'obsidok'
#Config::User.role = 'admin'

puts "Hello #{Config::User.login}. You are #{Config::User.role}"
#Menu.main
