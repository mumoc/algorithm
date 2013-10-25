require 'rspec'
require './node'
require './graph'

describe Graph do
  let(:initial_node) do
    node = Node.new
    node.set_as_initial
    node
  end

  let(:node) { Node.new}
  let(:nodes) { [initial_node, node] }

  let(:graph) { Graph.new }


  describe 'default state' do
    let(:new_graph) { Graph.new}

    it 'sets nodes as an empty hash' do
      expect(new_graph.nodes).to eql([])
    end
  end

  describe '#initial_node' do
    before do
      graph.nodes = nodes
    end

    it 'retrieve the initial node' do
      expect(graph.initial_node).to be_instance_of(Node)
      expect(graph.initial_node.initial?).to be_true
    end
  end

  describe '#current_node' do
    context 'Non setting a current_node' do
      it 'defaults to initial node' do
        expect(graph.current_node).to eql(graph.initial_node)
      end
    end

    context 'Setting a current node' do
      before do
        graph.current_node = node
      end

      it 'retrieve the node' do
        expect(graph.current_node).to eql(node)
      end
    end
  end

  describe '#unvisited_nodes' do
    it 'retrieve unvisited nodes' do
      expect(subject.unvisited_nodes).to eql([])
    end

    it 'doesn\'t contain the initial node' do
      expect(subject.unvisited_nodes.include?(initial_node)).to be_false
    end
  end
end
