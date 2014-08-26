=begin
    Copyright 2010-2014 Tasos Laskos <tasos.laskos@arachni-scanner.com>
    Please see the LICENSE file at the root directory of the project.
=end

class Arachni::Reporters::XML

# XML formatter for the results of the HTTPDicattack plugin
#
# @author Tasos "Zapotek" Laskos <tasos.laskos@arachni-scanner.com>
class PluginFormatters::HTTPDicattack < Arachni::Plugin::Formatter

    def run( xml )
        xml.username results['username']
        xml.password results['password']
    end

end
end
