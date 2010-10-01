module ActiveRecord
  class Base
    def self.moddb_connection(config)
      puts "moddb_connection" + config.inspect
      client = ::ModDB.new(config)
      ConnectionAdapters::ModdbAdapter.new(client, logger)
    end
  end
  
  module ConnectionAdapters
    class ModdbColumn < Column
      
    end
    
    class ModdbAdapter # < AbstractAdapter
      def initialize(connection, logger)
        puts "connection: " + connection.inspect
        puts "logger: " + logger.inspect
      end
      
      def adapter_name
        "Moddb"
      end
      
      def method_missing(*args)
        puts "method missing: " + args.inspect
        YAML.load(`ruby #{Rails.root}/lib/mod_db.rb #{args.join ', '}`)
      end
    end
  end
end

class ModDB
  def initialize(params)
    puts "ModDB" + params.inspect
  end
end