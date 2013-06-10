class ApplicationController < ActionController::Base
  protect_from_forgery

  def root
    @rule = [ 'AND',

      %W[ only operating_carriers AZ VE XM CT ],

      [ 'OR',

        %W[ first cities MOW LED SVX ],

        [ 'AND',
          %W[ first cities IEV ],
          %W[ only cities IEV ROM MIL ]],

        [ 'AND',
          %W[ first cities TBS ],
          %W[ only cities TBS ROM ]],

        [ 'AND',
          %W[ first cities EVN ],
          %W[ only cities EVN ROM ]]]]
  end
end
