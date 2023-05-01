class Array
  def subarray?(other)
    self.to_set.subset?(other.to_set)
  end
end
