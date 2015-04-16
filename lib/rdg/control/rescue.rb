require_relative "analyser"

module RDG
  module Control
    class Rescue < Analyser
      register_analyser :rescue

      def initialize(ast_node, graph, equivalences = Equivalences.new)
        super(ast_node, graph, equivalences)
        @main, *@fallbacks = children.reject(&:empty?)
      end

      def internal_flow_edges
        if @main.type == :begin
          @main.children.product(@fallbacks)
        else
          [@main].product(@fallbacks)
        end
      end

      def start_nodes
        [@main]
      end

      def end_nodes
        [@main] + @fallbacks
      end
    end
  end
end
