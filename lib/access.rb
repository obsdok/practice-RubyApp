require 'bcrypt'

class Access

    attr_reader :login, :role

    def initialize
        exit unless connect && checkLogin && checkPass
        @role = getRole
    end

    private

    def connect
        # Отловить ошибку при плохом соединении
        Config.connect = Mongo::Client.new([ '127.0.0.1:27017' ], :database => 'HelloMongo2')
        Config::Collections.users = Config.connect[:Users]
    end

    def checkLogin
        3.times do |i|
            return true if getLogin i
        end
        puts 'Access denied'
    end

    def getLogin(attempt)
        @login = ask("Input your login: ") if attempt == 0
        @login = ask("Wrong login, try again: ") if attempt > 0
        return true if @result = Config::Collections.users.find( { login: @login } ).first
    end

    def checkPass
        3.times do |i|
            return true if getsPass i
        end
        puts 'Access denied'
    end

    def getsPass(attempt)
        pass = ask("Input your pass: "){ |q| q.echo = "*" } if attempt == 0
        pass = ask("Wrong pass, try again: "){ |q| q.echo = "*" } if attempt > 0

        return true if BCrypt::Password.new( @result["pass"] ) == pass
    end

    def getRole
        @result["role"]
    end

end
