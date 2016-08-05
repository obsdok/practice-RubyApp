class ModerateUsers

    @@limit = 10

    def new.self
        @instance ||= self
    end

    def initialize
        choose do |menu|
          menu.prompt = "What we do? "
          menu.choice("Add user") { addUser }
          menu.choice("Show users") { ShowUsers.new(0) }
          menu.choice("Back") {  }
        end
    end

    private

    class AddUser

    end

    class ShowUsers

        def new.self
            @instance ||= self
        end

        def initialize(start)
        end

    end

end
