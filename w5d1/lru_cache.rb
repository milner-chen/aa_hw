class LRUCache
    def initialize(max_size)
        @max_size = max_size
        @cache = []
    end

    def count
      # returns number of elements currently in cache
      @cache.length
    end

    def add(el)
      # adds element to cache according to LRU principle
      # check if el is in cache
        # if yes: delete from cache
      # check if length of the cache == max_size
        # if yes: shift
      # push el
      if cache.include?(el)
        cache.delete(el)
      end
      if cache.length == max_size
        cache.shift
      end
      cache << el
    end

    def show
      # shows the items in the cache, with the LRU item first
      cache.dup
    end

    private
    # helper methods go here!
    attr_reader :cache, :max_size
  end