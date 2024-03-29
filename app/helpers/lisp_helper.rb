module LispHelper
  LOGIC_OPS = %W[AND OR NOT]
  FUNCTION_OPS = %W[any only first last]

  def render_node node
    case node.first
    when *LOGIC_OPS
      render_logic *node
    else
      render_function *node
    end
  end

  # TODO перенести .fn-list сюда?
  def render_rules rules
    rules.map do |rule|
      render_node rule
    end.join.html_safe
  end

  def render_logic op, *inner_nodes
    render 'logic', op: op, inner_nodes: inner_nodes
  end

  def render_function op, op2, *values
    render 'function', op: op, op2: op2, value: values.join(' ')
  end

  def options_for_logic_select selected=nil
    options_for_select LOGIC_OPS.map {|o| [t(o), o]}, selected
  end

  def options_for_function_select scope, selected=nil
    options_for_select FUNCTION_OPS.map {|o| [t(o, scope: scope), o]}, selected
  end
end
