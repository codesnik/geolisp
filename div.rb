require 'haml'

rule =
  [ :AND,

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


template = Haml::Engine.new(<<END)
!!! xhtml
%html
  %head
    %style
      div {
      padding: 5px;
      padding-left: 30px;
      border-style: solid;
      border-color: lightblue;
      border-width: 1px;
      border-radius: 3px;
      margin: 5px;
      }
      label {
      background: lightblue;
      }
  %body
    %div
      %label AND
      %div
        %label only
        operating_carriers
        %input(type="text" value="AZ VE XM CT")
      %div
        %label OR
        %div
          %label first
          cities
          %input(type="text" value="MOW LED SVX")
        %div
          %label AND
          %div
            %label first
            cities
            %input(type="text" value="IEV")
          %div
            %label only
            cities
            %input(type="text" value="IEV ROM MIL")
        %div
          %label AND
          %div
            %label first
            cities
            %input(type="text" value="TBS")
          %div
            %label only
            cities
            %input(type="text" value="TBS ROM")
END

puts template.render(binding)
