module Hastings
  class Dsl
    module Dir
      def dir(path = nil)
        path ? Hastings::Dir.new(path) : Hastings::Dir
      end
    end

    include Dir
  end
end
