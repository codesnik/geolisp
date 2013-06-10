class ApplicationController < ActionController::Base
  protect_from_forgery

  def root
    rule = [ :AND,

      [ :only, :operating_carriers, %[AZ VE XM CT]],

      [ :OR,

        [ :first, :cities, %[MOW LED SVX]],

        [ :AND,
          [ :first, :cities, %[IEV]],
          [ :only, :cities, %[IEV ROM MIL]]],

        [ :AND,
          [ :first, :cities, %[TBS]],
          [ :only, :cities, %[TBS ROM]]],

        [ :AND,
          [ :first, :cities, %[EVN]],
          [ :only, :cities, %[EVN ROM]]]]]
  end
end
