require 'bcrypt'

class Access

    def initialize
        exit unless connect && login && pass
        Config::User.login = @result[:login]
        Config::User.role = @result[:role]
    end

    private

    def connect
        # Отловить ошибку при плохом соединении
        Config.connect = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'HelloMongo2')
        Config::Collections.users = Config.connect[:Users]
    end

    def login
        3.times do |i|
            login = ask("Input your login: ") if i == 0
            login = ask("Wrong login, try again: ") if i > 0
            return true if @result = Config::Collections.users.find( { login: login } ).first
        end
        puts 'Access denied'
    end

    def pass
        3.times do |i|
            pass = ask("Input your pass: "){ |q| q.echo = "*" } if i == 0
            pass = ask("Wrong pass, try again: "){ |q| q.echo = "*" } if i > 0
            return true if BCrypt::Password.new( @result["pass"] ) == pass
        end
        puts 'Access denied'
    end

end
