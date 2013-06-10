# pretty much just a dumbed down version of SexpistolParser
# https://github.com/aarongough/sexpistol/blob/master/lib/sexpistol/sexpistol_parser.rb

require 'strscan'

class StupidSexprParser < StringScanner

  def initialize(string)
    unless string.count('(') == string.count(')')
      raise ArgumentError, "Missing closing parentheses"
    end
    super
  end

  def parse
    exp = []
    while token = fetch_token
      case token
      when '('
        exp << parse
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

