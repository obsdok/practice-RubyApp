class Menu

    class << self

        def main
            puts '___________________________________________________'
            choose do |menu|

              menu.choice("Moderate users") { moderateUsers; self.main } if Config::User.role == 'admin'
              menu.choice("Show categories") { showCategories; self.main }
              menu.choice("My settings") { mySettings; self.main }
              menu.choice("Show info") { showInfo; self.main }
              menu.choice("Exit") { exit }
            end
        end

        def moderateUsers
            require_relative './users/main.rb'
            ModerateUsers.new
        end


        def showCategories
            require_relative './users/main.rb'
        end

        def mySettings
            require_relative './users/settings.rb'
        end

        private

        def showInfo
            require 'sysinfo'
            sysinfo = SysInfo.new
            puts '___________________________________________________'
            p ">> Hello, #{sysinfo.user.capitalize}."
            p ">> Ruby -v #{sysinfo.ruby.join('.')}"

            p ">> Host is #{sysinfo.hostname}"
            p ">> Your local ip is #{sysinfo.ipaddress_internal}"
            puts '___________________________________________________'
        end
    end

end
