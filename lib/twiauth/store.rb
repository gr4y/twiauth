require 'pstore'

module TwiAuth
  # A simple key value store using PStore, provided by ruby
  class Store
    # Filename for pstore data file
    DATA_FILE = "data.pstore"
    # :nodoc:
    def initialize
      @store = PStore.new("#{PATH}#{DATA_FILE}")
    end

    # put a key with value
    def put(key, value)
      @store.transaction do
        @store[key] = value
      end
    end

    # get the value of the key 
    def get(key)
      @store.transaction do
        @value = @store[key]
      end
      @value
    end

    # delete a key 
    def delete(key)
      @store.transaction do
        @store.delete(key)
      end
    end
  end
end