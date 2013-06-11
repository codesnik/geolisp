module StupidSexpr
  class Emitter
    def initialize(doc)
      @doc = doc
    end

    def emit(doc=@doc)
      "(" +
      doc.map {|el|
        case el
        when Array
          emit(el)
        else
          el.to_s
        end
      }.join(" ") + ")"
    end
  end
end
