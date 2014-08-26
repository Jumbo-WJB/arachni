=begin
    Copyright 2010-2014 Tasos Laskos <tasos.laskos@arachni-scanner.com>
    Please see the LICENSE file at the root directory of the project.
=end

require 'set'

module Arachni
module Support::LookUp

# Lightweight look-up Set implementation.
#
# It uses stores hashes of items instead of the items themselves.
#
# This leads to decreased memory consumption and faster comparisons during look-ups.
#
# @author Tasos "Zapotek" Laskos <tasos.laskos@arachni-scanner.com>
class HashSet < Base

    # @param    (see Base#initialize)
    def initialize(*)
        super
        @collection = Set.new
    end

    [:merge, :replace, :superset?, :subset?].each do |m|
        define_method m do |other|
            @collection.send( m, other.collection )
            self
        end
    end
end

end
end
