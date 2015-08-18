Dir[File.expand_path("../fs/*", __FILE__)].each(&method(:require))
require "hastings/file"
require "hastings/dir"
Dir[File.expand_path("../dsl/*", __FILE__)].each(&method(:require))

module Hastings
  # Contains file-system related modules to be inherited by File, Dir
  # and future extensions.
  module FS; end
end
