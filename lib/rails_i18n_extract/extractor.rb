require "ast"
require "better_html"
require "better_html/parser"
require "parser"

module Rails
  module I18nExtract
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

        children.descendants.to_a
      end
    end
  end
end
