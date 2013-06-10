module ApplicationHelper
  def render_node node
    case node.first
    when 'AND', 'OR', 'NOT'
      render_logic *node
    else
      render_function *node
    end
  end

  def render_logic op, *inner_nodes
    render 'logic', op: op, inner_nodes: inner_nodes
  end

  def render_function op, op2, *values
    render 'function', op: op, op2: op2, value: values.join(' ')
  end
end
