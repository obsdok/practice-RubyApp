class Config

    class << self

        def new
            unless @instance
                require 'highline/import'
                require 'mongo'
                require_relative './access.rb'
                require_relative '../menu.rb'
                init
                yield(self)
            end
            @instance ||= self
        end

        attr_accessor :name, :environment, :connect

        private

        def init
            Mongo::Logger.logger.level = Logger::WARN
            Collections.new
        end
    end

    class User

        class << self

            def new
                unless @instance
                    yield(self)
                end
                @instance ||= self
            end

            attr_accessor :login, :role
        end

    end

    class Collections

        class << self
            def new
                @instance ||= self
            end

            attr_accessor :users, :items
        end
    end
end
