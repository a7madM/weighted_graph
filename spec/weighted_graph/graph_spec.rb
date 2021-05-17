require 'spec_helper'

# Graph API tests
module WeightedGraph
  describe Graph do
    it { is_expected.to respond_to(:add_edge).with(3).arguments }
    it { is_expected.to respond_to(:add_undirected_edge).with(3).arguments }
    it { is_expected.to respond_to(:remove_edge).with(2).arguments }
    it { is_expected.to respond_to(:remove_undirected_edge).with(2).arguments }
    it { is_expected.to respond_to(:contains_edge?).with(2).arguments }
    it { is_expected.to respond_to(:get_edge_weight).with(2).arguments }
    it { is_expected.to respond_to(:get_adjacent_vertices).with(1).argument }

    before do
      @graph = WeightedGraph::Graph.new
    end

    describe '.add_edge' do
      it 'adds a weighted edge to the graph' do
        expect(@graph.contains_edge?('A', 'B')).to be false
        @graph.add_edge('A', 'B', 12)
        expect(@graph.contains_edge?('A', 'B')).to be true
      end
      it 'can add multiple edges from a source vertex' do
        @graph.add_edge('A', 'B', 5)
        @graph.add_edge('A', 'C', 6)
        expect(@graph.contains_edge?('A', 'B')).to be true
        expect(@graph.contains_edge?('A', 'C')).to be true
      end
    end

    describe '.add_undirected_edge' do
      it 'adds edges in both directions' do
        @graph.add_undirected_edge('A', 'B', 5)
        expect(@graph.contains_edge?('A', 'B')).to be true
        expect(@graph.contains_edge?('B', 'A')).to be true
      end
    end

    describe '.remove_edge' do
      before do
        @graph.add_edge('A', 'B', 12)
        @graph.add_edge('A', 'C', 12)
      end

      it 'correctly removes an existing edge' do
        @graph.remove_edge('A', 'B')
        expect(@graph.contains_edge?('A', 'B')).to be false
      end
      it 'does not remove other edges from the same source' do
        @graph.remove_edge('A', 'B')
        expect(@graph.contains_edge?('A', 'B')).to be false
        expect(@graph.contains_edge?('A', 'C')).to be true
      end
      it 'gracefully returns for non-existing edges' do
        @graph.remove_edge('A', 'D')
        expect(@graph.contains_edge?('A', 'B')).to be true
        expect(@graph.contains_edge?('A', 'C')).to be true
      end
    end

    describe '.remove_undirected_edge' do
      before do
        @graph.add_edge('A', 'B', 12)
        @graph.add_undirected_edge('A', 'C', 6)
        @graph.add_edge('B', 'C', 3)
      end

      it 'removes existing edges between the two vertices' do
        @graph.remove_undirected_edge('A', 'B')
        expect(@graph.contains_edge?('A', 'B')).to be false
        @graph.remove_undirected_edge('A', 'C')
        expect(@graph.contains_edge?('A', 'C')).to be false
        expect(@graph.contains_edge?('C', 'A')).to be false
        @graph.remove_undirected_edge('C', 'B')
        expect(@graph.contains_edge?('B', 'C')).to be false
      end
    end

    describe '.get_edge_weight' do
      it 'returns weight submitted for a given edge' do
        @graph.add_edge('A', 'B', 5)
        @graph.add_undirected_edge('A', 'C', 6)
        expect(@graph.get_edge_weight('A', 'B')).to eq(5)
        expect(@graph.get_edge_weight('A', 'C')).to eq(6)
        expect(@graph.get_edge_weight('C', 'A')).to eq(6)
      end
      it 'returns infinity for non-edges' do
        expect(@graph.get_edge_weight('A', 'B')).to eq(Float::INFINITY)
      end
      it 'returns infinity for removed edges' do
        @graph.add_edge('A', 'B', 5)
        @graph.remove_edge('A', 'B')
        expect(@graph.get_edge_weight('A', 'B')).to eq(Float::INFINITY)
      end
    end

    describe '.get_adjacent_vertices' do
      it 'returns an empty set for vertices without outgoing edges' do
        @graph.add_edge('A', 'B', 12)
        expect(@graph.get_adjacent_vertices('B').empty?).to be true
        expect(@graph.get_adjacent_vertices('C').empty?).to be true
      end
      it 'returns all endpoints of outgoing edges' do
        @graph.add_edge('A', 'B', 12)
        @graph.add_edge('A', 'C', 3)
        @graph.add_edge('B', 'C', 5)

        adjacent_set = @graph.get_adjacent_vertices('A')
        expect(adjacent_set.size).to eq(2)
        expect(adjacent_set.include?('B')).to be true
        expect(adjacent_set.include?('C')).to be true
        expect(adjacent_set.include?('A')).to be false
      end
    end

    describe '.nodes' do
      it 'returns nodes for graph with edges' do
        @graph.add_edge('A', 'B', 5)
        @graph.add_undirected_edge('A', 'C', 6)
        expect(@graph.nodes).to eq(['A', 'B', 'C'])
      end
      it 'returns empty array for empty graphs' do
        expect(@graph.nodes).to eq([])
      end
    end
  end
end
