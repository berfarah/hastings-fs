module Hastings
  class Dsl
    # Dsl extensions for {Hastings::Dir}
    module Dir
      # Instantiates a directory or references {Hastings::Dir}
      # @param path [String] (optional)
      # @return [Hastings::Dir] (instance or class)
      def dir(path = nil)
        path ? Hastings::Dir.new(path) : Hastings::Dir
      end
    end

    include Dir
  end
end
