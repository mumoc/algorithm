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
    @current_node ||= @initial_node
  end

  def unvisited_nodes
    @unvisited_nodes ||= @current_node.neighbors
  end

  def get_smaller_neighbor_distance
    tentative_distance = 0
    @unvisited_nodes.each do |node|
      distance = @current_node.distance_to node
      tentative_distance = distance if distance < tentative_distance
    end
    tentative_distance
  end

end
