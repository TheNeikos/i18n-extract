require 'i18n_extract'
require 'minitest/autorun'

class ErbFilesTest < MiniTest::Test
  def file_path_for name
    File.join(File.dirname(__FILE__), "test_cases/#{name}.html.erb")
  end

  def test_parse_empty_file
    path = file_path_for "empty"
    extractor = I18nExtract::Extractor.new(path)
    results = extractor.extract
    assert results.empty?
  end

  def test_parse_text_file
    path = file_path_for "simple"
    extractor = I18nExtract::Extractor.new(path)
    results = extractor.extract
    refute results.empty?
  end

  def test_output_simple_file
    path = file_path_for "simple"
    extractor = I18nExtract::Extractor.new(path)
    results = extractor.extract
    assert results.size == 1
  end

  def test_location_simple_file
    path = file_path_for "simple"
    extractor = I18nExtract::Extractor.new(path)
    results = extractor.extract
    location = results.first.location
    assert location.line == 1
  end

  def test_validate_complex_file
    path = file_path_for "complex"
    extractor = I18nExtract::Extractor.new(path)
    extractor.validate!
  end
end
