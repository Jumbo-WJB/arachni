=begin
    Copyright 2010-2014 Tasos Laskos <tasos.laskos@arachni-scanner.com>
    Please see the LICENSE file at the root directory of the project.
=end

class Arachni::Reporters::AFR < Arachni::Reporter::Base
    def run
        File.open( "afr", "w" ) {}
    end
end
