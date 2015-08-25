require "hastings/fs/utils"

module Hastings
  class Dsl
    module FS
      # TODO: Make Utils more extensible in terms of coercion
      module Utils
        # @param from [String|Hastings::File|Hastings::Dir]
        # @param to [String|Hastings::File|Hastings::Dir]
        def copy(from, to)
          alias_parsed(:copy, from, to)
        end

        # @param path [String|Hastings::File|Hastings::Dir]
        def delete(path)
          alias_parsed(:delete, path)
        end

        # @param from [String|Hastings::File|Hastings::Dir]
        # @param to [String|Hastings::File|Hastings::Dir]
        def move(from, to)
          alias_parsed(:move, from, to)
        end

        alias_method :rename, :move

        private

          def alias_parsed(method, *args)
            Hastings::FS::Utils.public_send(
              method, *args.map(&method(:parse_path)))
          end

          def parse_path(obj)
            obj.respond_to?(:path) ? obj.path : obj
          end
      end
    end

    include FS::Utils
  end
end
