=begin
    Copyright 2010-2014 Tasos Laskos <tasos.laskos@arachni-scanner.com>
    Please see the LICENSE file at the root directory of the project.
=end

class Arachni::Reporters::Stdout

# Stdout formatter for the results of the CookieCollector plugin
#
# @author Tasos "Zapotek" Laskos <tasos.laskos@arachni-scanner.com>
class PluginFormatters::CookieCollector < Arachni::Plugin::Formatter

    def run
        results.each_with_index do |result, i|
            print_info "[#{(i + 1).to_s}] On #{result['time']}"
            print_info "URL: #{result['response']['url']}"

            print_info 'Cookies forced to: '
            result['cookies'].each_pair do |name, value|
                print_info "    #{name} => #{value}"
            end

            print_line
        end
    end

end
end
