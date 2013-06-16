# pretty much just a dumbed down version of SexpistolParser
# https://github.com/aarongough/sexpistol/blob/master/lib/sexpistol/sexpistol_parser.rb

require 'strscan'

module StupidSexpr
  class Parser < StringScanner

    def initialize(string)
      unless string.count('(') == string.count(')')
        raise ArgumentError, "Missing closing parentheses"
      end
      super
    end

    def parse
      parse_one
    end

    def parse_one
      exp = []
      while token = fetch_token
        case token
        when '('
          exp << parse_one
        when ')'
          break
        else
          exp << token
        end
      end
      exp
    end

    def fetch_token
      skip(/\s+/)
      return nil if(eos?)

      token =
      # Match parentheses
      if scan(/[\(\)]/)
        matched
      elsif scan(/[^\(\)\s]+/)
        matched
      # If we've gotten here then we have an invalid token
      else
        near = scan %r{.{0,20}}
        raise ArgumentError, "Invalid character at position #{pos} near '#{near}'."
      end
    end
  end
end

