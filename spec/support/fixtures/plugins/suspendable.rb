=begin
    Copyright 2010-2014 Tasos Laskos <tasos.laskos@gmail.com>
    All rights reserved.
=end

class Arachni::Plugins::Suspendable < Arachni::Plugin::Base

    attr_reader :counter

    def prepare
        @counter = 0
    end

    def restore( counter )
        @counter = counter
    end

    def run
        options['my_option'] = 'updated'
        @counter += 1
        loop { sleep 1 }
    end

    def suspend
        @counter
    end

    def self.info
        {
            name:        'Suspendable',
            description: %q{},
            author:      'Tasos "Zapotek" Laskos <tasos.laskos@gmail.com>',
            version:     '0.1',
            options:     [
                Options::String.new( 'my_option', [ true, 'Required option' ] ),
            ]
        }
    end

end
