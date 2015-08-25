require "hastings/fs/absolute_paths"
require "hastings/fs/path"
require "hastings/fs/stat"
require "hastings/fs/utils"

module Hastings
  # {File} is an extension of {::File} with additional user-friendly methods
  # (see included modules)
  class File < ::File
    include Hastings::FS::AbsolutePaths
    include Hastings::FS::Path
    include Hastings::FS::Stat
    include Hastings::FS::Utils

    # @return [Fixnum] amount of lines in the file
    def lines
      each_line.count
    end
  end
end
