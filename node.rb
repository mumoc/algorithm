class Node
  attr_accessor :distance, :visited, :neighbors, :name

  def initialize *args
    args.each do |k,v|
      instance_variable_set("@#{k}", v) unless v.nil?
    end
    @name ||= ''
    @neighbors ||= []
  end

  def set_as_initial
    self.distance = 0
  end

  def initial?
    !!self.distance
  end
end
