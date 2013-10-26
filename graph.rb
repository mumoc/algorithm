require 'ostruct'

class Graph
  attr_accessor :nodes, :initial_node, :current_node, :unvisited_nodes,
    :tentative, :target_node, :path

  def initialize args={}
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
    @full_path = ''
  end

  def current_node
    @current_node ||= initial_node
  end

  def unvisited_nodes
    current_node.neighbors
  end

  def initial_node=(node)
    @path = [node]
    @initial_node = node
  end

  def get_smaller_neighbor_distance
    unvisited_nodes.each do |node|
      distance = current_node.distance_to(node)
      if (!@tentative || distance < @tentative.distance)
        @tentative = node
      end
    end
    puts @tentative.distance
    @current_node = extract_node(@tentative)
    @path << @current_node
    #get_smaller_neighbor_distance unless @current_node.name.match @target_node.name
  end

  def shortest_path
    get_smaller_neighbor_distance
  end

  private
  def extract_node(node)
    puts node.distance
    new_node = @nodes[node.name.to_sym]
    new_node.distance = node.distance
    new_node
  end

end
