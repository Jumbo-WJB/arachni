=begin
    Copyright 2010-2014 Tasos Laskos <tasos.laskos@arachni-scanner.com>
    Please see the LICENSE file at the root directory of the project.
=end

module Arachni
class Page

# Determines the {Scope scope} status of {Page}s.
#
# @author Tasos "Zapotek" Laskos <tasos.laskos@arachni-scanner.com>
class Scope < HTTP::Response::Scope

    # @author Tasos "Zapotek" Laskos <tasos.laskos@arachni-scanner.com>
    class Error < HTTP::Response::Scope::Error
    end

    def initialize( page )
        # We're passing the page itself instead of the Page#response because we
        # want it to use the (possibly browser-evaluated) Page#body for content
        # scope checks.
        super page

        @page = page
    end

    # @note Also takes into account the {HTTP::Response::Scope} of the {Page#response}.
    #
    # @return   [Bool]
    #   `true` if the {Page} is out of {OptionGroups::Scope scope},
    #   `false`otherwise.
    #
    # @see #dom_depth_limit_reached?
    def out?
        dom_depth_limit_reached? || super
    end

    # @return   [Bool]
    #   `true` if the {Page::DOM#depth} is greater than
    #   {OptionGroups::Scope#dom_depth_limit} `false` otherwise.
    #
    # @see OptionGroups::Scope#dom_depth_limit
    def dom_depth_limit_reached?
        options.dom_depth_limit && @page.dom.depth > options.dom_depth_limit
    end

end

end
end
