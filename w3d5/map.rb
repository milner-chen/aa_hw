class Map
    def initialize
        @map = []
    end

    def set(key, value)
        @map.each_with_index do |x, i|
            if x[0] == key
                @map[i][1] = value
                return @map
            end
        end
        @map << [key, value]
    end

    def get(key)
        @map.each {|x| return x[1] if x[0] == key }
        nil
    end

    def delete(key)
        @map.each_with_index do |x, i|
            if x[0] == key
                @map = @map[0...i] + @map[i + 1..-1]
                return x
            end
        end
        nil
    end

    def show # assuming they want to display it like a hash?
        print "{"
        @map.each_with_index do |x, i|
            print "#{x[0]}=>#{x[1]}"
            print ", " if i != @map.length - 1
        end
        print "}"
        puts
    end 
end
