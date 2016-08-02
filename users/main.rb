class ModerateUsers

    class << self

        def new
            @instance ||= self
        end

        private

        def showMenu
            choose do |menu|
              menu.prompt = "What we do? "
              menu.choice("Add user") { addUser }
              menu.choice("Show users") { showUsers(0) }
            end
        end

        def addUser
        end

        def showUsers(start)
        end

        def editUser(id)
        end

        def deleteUser(id)
        end

    end

end
