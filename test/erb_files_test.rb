require 'rails_i18n_extract'
require 'minitest/autorun'

class ErbFilesTest < MiniTest::Test
  def test_parse_empty_file
    path = File.join(File.dirname(__FILE__), "test_cases/empty.html.erb")
    extractor = Rails::I18nExtract::Extractor.new(path)
    results = extractor.extract
    assert results.empty?
  end
end
