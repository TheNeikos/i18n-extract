require 'ast'

module I18nExtract
  class HTMLIterator
    def initialize(&block)
      @block = block
    end

    def traverse(node)
      return unless node.is_a?(::AST::Node)
      case node.type
      when :tag
        tag_name, children = *node.to_a
        return if %w(style script).include? tag_name.to_s
      when :text
        @block.call(node)
      end
      traverse_all(node)
    end

    def traverse_all(nodes)
      clean(nodes).each do |node|
        traverse(node) if node.is_a?(::AST::Node)
      end
    end

    def clean(nodes)
      skip = 0
      nodes.to_a.reject do |node|
        next true unless node.is_a?(::AST::Node)
        if node&.type == :tag
          solidus, tag_name = *node
          if %w(style script).include? tag_name.to_a.first
            if solidus.nil?
              skip = skip + 1
            else
              skip = skip - 1
            end
            next true
          end
        end
        skip != 0
      end
    end

    def self.descendants(root_node)
      Enumerator.new do |yielder|
        t = new() { |node| yielder << node }
        t.traverse(root_node)
      end
    end
  end
end
