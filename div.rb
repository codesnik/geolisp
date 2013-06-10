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
    :css
      .logic, .function {
        padding: 5px;
        padding-left: 30px;
        margin: 5px;
        border: solid 1px lightblue;
        border-radius: 5px;
      }
      .drop-target {
      }
      label {
        background: lightblue;
        border: solid 1px blue;
        border-radius: 5px;
        margin: 5px;
        margin-left: -25px;
        padding: 2px;
        cursor: move;
      }
  %body
    .logic
      %label AND
      .drop-target
        .function
          %label operating_carriers
          only
          %input(type="text" value="AZ VE XM CT")
        .logic
          %label OR
          .drop-target
            .function
              %label cities
              first
              %input(type="text" value="MOW LED SVX")
            .logic
              %label AND
              .drop-target
                .function
                  %label cities
                  first
                  %input(type="text" value="IEV")
                .function
                  %label cities
                  only
                  %input(type="text" value="IEV ROM MIL")
            .logic
              %label AND
              .drop-target
                .function
                  %label cities
                  first
                  %input(type="text" value="TBS")
                .function
                  %label cities
                  only
                  %input(type="text" value="TBS ROM")
            .logic
              %label AND
              .drop-target
                .function
                  %label cities
                  first
                  %input(type="text" value="EVN")
                .function
                  %label cities
                  only
                  %input(type="text" value="EVN ROM")
END

puts template.render(binding)
