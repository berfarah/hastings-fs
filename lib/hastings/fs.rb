Dir[File.expand_path("../fs/*", __FILE__)].each(&method(:require))
require "hastings/file"
require "hastings/dir"
Dir[File.expand_path("../dsl/*", __FILE__)].each(&method(:require))
