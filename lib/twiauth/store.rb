require 'pstore'

module TwiAuth
  # A simple key value store using PStore, provided by ruby
  class Store
    # Filename for pstore data file
    STORE_FILENAME = "data.pstore"
    # :nodoc:
    def initialize
      prepare_store
      @store = PStore.new(STORE_PATH + STORE_FILENAME)
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

    private
    # preparing the new data store
    def prepare_store
      if !::Dir.exists?(STORE_PATH)
        ::Dir.mkdir(STORE_PATH)
      end
      if !::File.exists?(STORE_PATH + STORE_FILENAME)
        migrate_old_store
      end
    end

    # migrate old data store from version 0.1.0
    def migrate_old_store
    old_data_file =  PATH + STORE_FILENAME
      if ::File.exists?(old_data_file)
        ::FileUtils.move old_data_file, STORE_PATH
      end
    end
  end
end