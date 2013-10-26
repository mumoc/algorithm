require 'rspec'
require './node'
require './graph'

describe Graph do
  let(:node_a) do
    node = Node.new
    node.distance = 5
    node
  end

  let(:node_b) do
    node = Node.new
    node.distance = 7
    node
  end

  let(:initial_node) do
    node = Node.new
    node.set_as_initial
    node.neighbors = [node_a, node_b]
    node
  end

  let(:nodes) { [initial_node, node_a,  node_b] }

  let(:graph) { Graph.new }

  describe '#current_node' do
    context 'Non setting a current_node' do
      it 'defaults to initial node' do
        expect(graph.current_node).to eql(graph.initial_node)
      end
    end

    context 'Setting a current node' do
      before do
        graph.current_node = node_a
      end

      it 'retrieve the node' do
        expect(graph.current_node).to eql(node_a)
      end
    end
  end

  describe '#unvisited_nodes' do
    before do
      graph.initial_node = initial_node
    end

    it 'retrieve unvisited nodes' do
      expect(graph.unvisited_nodes).to eql(initial_node.neighbors)
    end

    it 'doesn\'t contain the initial node' do
      expect(graph.unvisited_nodes.include?(initial_node)).to be_false
    end
  end

  describe '#get_smaller_neighbor_distance' do
    before do
      graph.initial_node = initial_node
    end

    it 'returns the smaller distance' do
      expect(graph.get_smaller_neighbor_distance).to eql(5)
    end

  end
end
