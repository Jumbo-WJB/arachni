=begin
    Copyright 2010-2014 Tasos Laskos <tasos.laskos@arachni-scanner.com>
    Please see the LICENSE file at the root directory of the project.
=end

# Overloads the {Object} class providing a {#deep_clone} method.
#
# @author Tasos "Zapotek" Laskos <tasos.laskos@arachni-scanner.com>
class Object

    # Deep-clones self using a Marshal dump-load.
    #
    # @return   [Object]
    #   Duplicate of self.
    def deep_clone
        Marshal.load( Marshal.dump( self ) )
    end

    def to_rpc_data_or_self
        respond_to?( :to_rpc_data ) ? to_rpc_data : self
    end

end
