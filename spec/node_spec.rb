require 'rspec'

class Node
  attr_accessor :distance, :visited, :neighbors

  def initialize
    @neighbors = []
  end

  def set_as_initial
    self.distance = 0
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
end


class Graph
  attr_accessor :nodes

  def initialize
    @nodes = {}
  end
end

describe Graph do
  subject { Graph.new }

  describe 'attributes' do
    it 'responds to nodes' do
      expect(subject).to respond_to 'nodes'
    end
  end

  describe 'default state' do
    it 'sets nodes as an empty hash' do
      expect(subject.nodes).to eql({})
    end
  end

  describe '#initial_node' do

  end

  describe '#unvisited_nodes' do
    it 'retrieve unvisited nodes' do
      expect(subject.unvisited_nodes).to eql([])
    end

  end
end
