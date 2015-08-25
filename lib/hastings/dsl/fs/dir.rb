require "hastings/fs/dir"

module Hastings
  class Dsl
    module FS
      # Dsl extensions for {Hastings::Dir}
      module Dir
        # Instantiates a directory or references {Hastings::Dir}
        # @param path [String] (optional)
        # @return [Hastings::Dir] (instance or class)
        def dir(path = nil)
          path ? Hastings::Dir.new(path) : Hastings::Dir
        end
      end
    end

    include FS::Dir
  end
end
