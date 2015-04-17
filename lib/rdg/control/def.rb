require_relative "propagater"

module RDG
  module Control
    class Def < Propagater
      register_analyser :def

      def prepare
        _name, _args, @body = children
      end

      def internal_flow_edges
        []
      end

      def start_node
        @body
      end

      def end_nodes
        [@body]
      end

      def nodes
        [@body]
      end
    end
  end
end
