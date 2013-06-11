class ApplicationController < ActionController::Base
  protect_from_forgery

  require 'stupid_sexpr/parser'
  def root
    @rule = StupidSexpr::Parser.new(%[
      (AND
        (only operating_carriers AZ VE XM CT)
        (OR
          (first cities MOW LED SVX)
          (AND
            (first cities IEV )
            (only cities IEV ROM MIL))
          (AND
            (first cities TBS)
            (only cities TBS ROM))
          (AND
            (first cities EVN)
            (only cities EVN ROM))))
    ]).parse
  end
end
