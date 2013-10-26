require 'rspec'
require './node'
require './graph'


describe 'Integration' do
  let(:node_a) do
    node_b = Node.new({ name: 'B', distance: 7 })
    node_c = Node.new({ name: 'C', distance: 9 })
    node_d = Node.new({ name: 'D', distance: 14 })

    Node.new({ name: 'A',
               neighbors: [node_b, node_c, node_d]
            })
  end

  let(:node_b) do
    node_a = Node.new({ name: 'A', distance: 7 })
    node_c = Node.new({ name: 'C', distance: 10 })
    node_e = Node.new({ name: 'E', distance: 16 })

    Node.new({ name: 'B',
               neighbors: [node_a, node_c, node_e]
            })
  end

  let(:node_c) do
    node_a = Node.new({ name: 'A', distance: 9 })
    node_b = Node.new({ name: 'B', distance: 10 })
    node_e = Node.new({ name: 'E', distance: 11 })
    node_d = Node.new({ name: 'D', distance: 2 })

    Node.new({ name: 'C',
               neighbors: [node_a, node_b, node_e, node_d]
            })
  end

  let(:node_d) do
    node_a = Node.new({ name: 'A', distance: 14 })
    node_c = Node.new({ name: 'C', distance: 2 })
    node_f = Node.new({ name: 'F', distance: 9 })

    Node.new({ name: 'D',
               neighbors: [node_a, node_c, node_f]
            })
  end

  let(:node_e) do
    node_b = Node.new({ name: 'B', distance: 16 })
    node_c = Node.new({ name: 'C', distance: 11 })
    node_f = Node.new({ name: 'F', distance: 6 })

    Node.new({ name: 'E',
               neighbors: [node_b, node_c, node_f]
            })
  end

  let(:node_f) do
    node_d = Node.new({ name: 'D', distance: 9 })
    node_e = Node.new({ name: 'E', distance: 6 })

    Node.new({ name: 'F',
               neighbors: [node_d, node_e]
            })
  end

  let(:graph) do
    Graph.new({
      nodes: [
        node_a,
        node_b,
        node_c,
        node_d,
        node_e,
        node_f
      ]
    })
  end

  describe '#shortest_path' do
    before do
      graph.initial_node = node_a
      graph.target_node = node_f
    end

    it 'returns 20' do
      expect(graph.shortest_path).to eql(20)
    end
  end
end
