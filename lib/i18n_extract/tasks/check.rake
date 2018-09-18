require 'colorize'

namespace :'i18n-extract' do
  desc "Check views for hard-coded strings"
  task :check => :environment do
    root = Rails.root.join('app','views')
    Dir.glob("#{root}/**/*.html.erb").each do |file|
      extractor = I18nExtract::Extractor.new(file)
      extractor.extract.each do |r|
        puts r.location.to_s.colorize(:red)
        loc = r.location
        if loc.stop_line - loc.start_line > 0
          lines = loc.source_buffer.source_lines
          start_line = loc.start_line
          stop_line = loc.stop_line
          print lines[start_line - 1][0..(loc.start_column - 1)].colorize(:gray)
          puts lines[start_line - 1][loc.start_column..-1].colorize(:red)
          lines[start_line...(stop_line - 1)].each do |line|
            puts line.colorize(:red)
          end
          print lines[stop_line - 1][0..(loc.stop_column - 1)].colorize(:red)
          puts lines[stop_line - 1][(loc.stop_column)..-1].colorize(:gray)
        else
          line = loc.source_line
          print line[0..(loc.start_column - 1)].colorize(:gray)
          print line[loc.start_column..(loc.stop_column - 1)].colorize(:red)
          print line[(loc.stop_column)..-1].colorize(:gray)
          puts
          puts "#{" " * loc.start_column}#{"^" * (loc.stop_column - loc.start_column)}"
        end
        puts
      end
    end
  end

end
