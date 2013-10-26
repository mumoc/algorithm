require 'rspec'
require './node'

describe Node do
  subject { Node.new }

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


  describe '#distance_to' do
    let(:node) { Node.new }
    let(:other_node) do
      node = Node.new
      node.distance = 5
      node
    end

    context 'having the node as neighbor' do
      before do
        node.neighbors = [other_node]
      end
      it 'retrieves the distance' do
        expect(node.distance_to(other_node)).to eql(5)
      end
    end

    context 'not having the node as neighbor' do
      it 'returns nil' do
        expect(node.distance_to(other_node)).to be_false
      end
    end
  end


end
