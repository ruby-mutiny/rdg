require_relative "analyser"

module RDG
  module Control
    class None < Analyser
      register_default_analyser
    end
  end
end
