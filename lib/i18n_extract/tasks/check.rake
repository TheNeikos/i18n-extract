namespace :'i18n-extract' do
  desc "Check views for hard-coded strings"
  task :check => :environment do
    root = Rails.root.join('app','views')
    Dir.glob("#{path}/**/*.html.erb").each do |file|
      extractor = I18nExtract::Extractor.new(path)
      extractor.result.each do |r|
        print "Found possible hardcoded text:"
        print r.location
        print r.location.line_source_with_underline
      end
    end
  end

end
