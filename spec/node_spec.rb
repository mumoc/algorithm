require 'rspec'

class Node
  attr_accessor :distance, :visited, :neighbors, :name

  def initialize
    @neighbors = []
    @name = ''
  end

  def set_as_initial
    self.distance = 0
  end

  def initial?
    !!self.distance
  end
end

describe Node do
  subject { Node.new }
  describe 'attributes' do
    it 'responds to distance' do
      expect(subject).to respond_to 'distance'
    end

    it 'responds to visited' do
      expect(subject).to respond_to 'visited'
    end

    it 'responds to neighbors' do
      expect(subject).to respond_to 'neighbors'
    end

    it 'responds to name' do
      expect(subject).to respond_to 'name'
    end
  end

  describe 'default state' do
    it 'sets visited as false' do
      expect(subject.visited).to be_false
    end

    it 'doesn\'t set any distance' do
      expect(subject.distance).to be_nil
    end

    it 'sets neighbors as an array' do
      expect(subject.neighbors).to be_instance_of Array
    end

    it 'sets name as an empty string' do
      expect(subject.name).to eql('')
    end
  end

  describe '#set_as_initial' do
    let(:initial_node) { Node.new }

    before do
      initial_node.set_as_initial
    end

    it 'sets distance to 0' do
      expect(initial_node.distance).to eql 0
    end
  end

  describe '#initial?' do
    let(:node) { Node.new }

    context 'having 0 as distance' do
      before do
        node.set_as_initial
      end

      it 'returns true' do
        expect(node.initial?).to be_true
      end
    end

    context 'not having distance' do
      it 'returns false' do
        expect(node.initial?).to be_false
      end
    end
  end
end


class Graph
  attr_accessor :nodes, :initial_node

  def initialize
    @nodes = []
  end

  def initial_node
    @initial_node || self.nodes.select {|node| node.initial? }
  end

end

describe Graph do
  subject { Graph.new }

  describe 'attributes' do
    it 'responds to nodes' do
      expect(subject).to respond_to 'nodes'
    end

    it 'responds to initial_node' do
      expect(subject).to respond_to 'initial_node'
    end
  end

  describe 'default state' do
    it 'sets nodes as an empty hash' do
      expect(subject.nodes).to eql([])
    end
  end


  describe '#initial_node' do
    let(:nodes) { [Node.new(distance: 0), Node.new] }
    let(:graph) { Grap.new nodes: nodes }

    context 'having nodes' do
      it 'retrieve the initial node' do
        expect(subject.initial_node).to be_instance_of(Node)
        expect(subject.initial_node.initial?).to be_true
      end
    end

  end

  #describe '#unvisited_nodes' do
    #it 'retrieve unvisited nodes' do
      #expect(subject.unvisited_nodes).to eql([])
    #end

  #end
end
