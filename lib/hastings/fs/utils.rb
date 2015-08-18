require "fileutils"

module Hastings
  module FS
    # File and Dir utilities
    module Utils
      # Methods to be called if the class is called
      module Methods
        # Copy the file/directory to the new path
        # @param new_path [String]
        def copy(new_path)
          FileUtils.cp(path, new_path)
        end

        # Delete the file or directory
        def delete
          FileUtils.rm_r(path)
        end

        # Move the file or directory to the new path
        # @param new_path [String]
        def move(new_path)
          FileUtils.mv(path, new_path)
        end

        # see {#move}
        alias_method :rename, :move
      end

      # Bring in the methods when included. We split up the methods this way
      # so that the module can work as a standalone as well.
      # @param base [Class]
      def self.included(base)
        base.include(Methods)
      end

      # @private This method redirects to Methods using an object with
      # a path
      def self.method_missing(name, *args, &block)
        @obj_with_path ||= Struct.new(:path) { include Methods }
        @obj_with_path.new(args.shift).send(name, *args, &block)
      end
    end
  end
end
