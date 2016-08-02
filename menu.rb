class Menu

    class << self

        def main
            choose do |menu|
              menu.prompt = "What we do? "

              menu.choice("Moderate users") { moderateUsers } if Config::User.role == 'admin'
              menu.choice("Show categories") { showCategories }
              menu.choice("My settings") { mySettings }
              menu.choice("Show info") { showInfo }
              menu.choice("Exit") { exit }
            end
            @instance ||= self
        end

        def moderateUsers
            require_relative './users/main.rb'
            #ModerateUsers.showMenu
        end


        def showCategories
            require_relative './users/main.rb'
        end

        def mySettings

        end

        private

        def showInfo
            require 'sysinfo'
            sysinfo = SysInfo.new
            puts ""
            p ">> Hello, #{sysinfo.user.capitalize}."
            p ">> Ruby -v #{sysinfo.ruby.join('.')}"

            p ">> Host is #{sysinfo.hostname}"
            p ">> Your local ip is #{sysinfo.ipaddress_internal}"
            puts ""
        end

    end

end
