module Hastings
  class Dsl
    # File DSL only provides File
    module File
      def file(path = nil)
        path ? Hastings::File.new(path) : Hastings::File
      end

      def absolute_path(path)
        Hastings::File.absolute_path(path)
      end
    end

    include File
  end
end
