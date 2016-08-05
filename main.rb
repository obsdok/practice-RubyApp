require_relative './lib/config.rb'

Config.new do |app|
    app.name = "HelloMongo2"
    app.environment = :development
    app::User.new do |user|
        user.login = 'Guest'
        user.role = 'user'
    end
end

#Access.new()

Config::User.login = 'Obsidok'
Config::User.role = 'admin'

puts "Hello #{Config::User.login}. You are #{Config::User.role}"
Menu.main
