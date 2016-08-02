class Item

    class << self

        def new
            @instance ||= self
        end

        def show

            @items = []

            Dir.entries( '.' ).select do |f|
                unless File.directory? f
                    require_relative "./#{f}/main.rb"
                end
            end

            @items.each do |item|
                puts item[:name]
            end

        end

    end

end
