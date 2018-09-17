require "ast"
require "better_html"
require "better_html/parser"
require "parser"

module Rails
  module I18nExtract
    class ExtractError < StandardError
      attr_reader :node
      def initialize(node, *args)
        super *args
        @node = node
      end
    end

    class Extractor
      attr_reader :path

      def initialize path
        @path = path
        @buffer = Parser::Source::Buffer.new(@path)
        @buffer.source = File.read(@path)
        @parser = BetterHtml::Parser.new(@buffer)
      end

      def extract
        children = @parser.ast

        children.descendants(:text)
          .reject { |node|
          node.children.reject{|child| !child.is_a?(String) }.map(&:strip).join('').blank?
        }.to_a
      end

      def validate!
        res = extract
        res.each do |node|
          raise ExtractError.new(node, "Found hard coded string") unless node.children.join('').blank?
        end
      end
    end
  end
end
