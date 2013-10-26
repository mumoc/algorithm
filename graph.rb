require 'ostruct'

class Graph
  attr_accessor :nodes, :initial_node, :current_node, :unvisited_nodes,
    :tentative, :target_node, :path, :full_path

  def initialize args={}
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
  end

  def current_node
    @current_node ||= initial_node
  end

  def unvisited_nodes
    current_node.neighbors.keep_if do |node|
      !@path.keys.include?(node.name)
    end
  end

  def initial_node=(node)
    @path = { node.name => node }
    @initial_node = node
  end

  def get_smaller_neighbor_distance
    unvisited_nodes.each do |node|
      distance = @current_node.distance_to(node)
      if (!@tentative || distance < @tentative.distance)
        @tentative = node
      end
    end
    @current_node = extract_node(@tentative)
    @path.merge!({ @current_node.name => @current_node })
    @tentative = nil
    get_smaller_neighbor_distance unless @current_node.name.match(@target_node.name)
  end

  def shortest_path
    get_smaller_neighbor_distance
    set_full_path
    calculate_full_distance
  end

  private
  def extract_node(node)
    new_node = @nodes[node.name.to_sym]
    new_node.distance = node.distance
    new_node
  end

  def set_full_path
    @full_path = @path.keys.join(' -> ')
  end

  def calculate_full_distance
    full_distance = 0
    @path.each do |k, node|
      full_distance = full_distance + (node.distance || 0) unless  node.name.match(@target_node.name)
    end
    full_distance
  end
end
