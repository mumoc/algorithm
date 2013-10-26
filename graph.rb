require 'ostruct'

class Graph
  attr_accessor :nodes, :initial_node, :current_node, :unvisited_nodes,
    :tentative, :target_node, :path

  def initialize args={}
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
    @nodes ||= []
    @path = []
    @full_path = ''
  end

  def current_node
    @current_node ||= initial_node
  end

  def unvisited_nodes
    current_node.neighbors
  end

  def get_smaller_neighbor_distance
    unvisited_nodes.each do |node|
      distance = current_node.distance_to(node)
      if (!@tentative || distance < @tentative.distance)
        @tentative = node
      end
    end
    @path << @tentative
    @current_node = @tentative
    @current_node.distance
    get_smaller_neighbor_distance unless @current_node.name.match @target_node.name
  end

  def shortest_path
    get_smaller_neighbor_distance
  end

end
