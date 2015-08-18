module Hastings
  class Dsl
    # Dsl extensions for {Hastings::File}
    module File
      # Instantiates a file or references {Hastings::File}
      # @param path [String] (optional)
      # @return [Hastings::File] (instance or class)
      def file(path = nil)
        path ? Hastings::File.new(path) : Hastings::File
      end

      # @param path [String]
      # @return [String]
      def absolute_path(path)
        Hastings::File.absolute_path(path)
      end
    end

    include File
  end
end
