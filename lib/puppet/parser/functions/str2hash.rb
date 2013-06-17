#
# str2hash.rb
#

module Puppet::Parser::Functions
  newfunction(:str2hash, :type => :rvalue, :doc => <<-EOS
  
  EOS
  ) do |arguments|
    require 'json'

    raise(Puppet::ParseError, "str2hash(): Wrong number of arguments " + 
      "passed (#{arguments.size} but we require 1)") if arguments.size != 1

    string = arguments[0]

    unless string.is_a?(String)
      raise(Puppet::ParserError, 'str2hash(): Requires a ' +
        "string argument, you passed: #{string.class}")
    end

    begin
      hash = JSON.parse(string)
    rescue Exception => ex
      raise(Puppet::ParseError, "str2hash(): Unable to parse argument: #{ex.message}")
    end

    return hash
  end
end
