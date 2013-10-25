class Graph
  attr_accessor :nodes, :initial_node, :current_node, :unvisited_nodes

  def initialize *args
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
    @nodes ||= []
  end

  def initial_node
    @initial_node ||= self.nodes.select{|node| node.initial?}.first
  end

  def current_node
    @current_node ||= self.initial_node
  end

  def unvisited_nodes
    @unvisited_nodes ||= @nodes.reject {|node| node.initial? }
  end

end
