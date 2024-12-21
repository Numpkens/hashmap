class HashMap
  def initialize(load_factor = 0.75)
    @load_factor = load_factor
    @capacity = 16
    @size = 0
    @buckets = Array.new(@capacity) { [] }
  end

  def hash(key)
    hash_code = 0
    prime_number = 31

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def set(key, value)
    resize if should_resize?

    index = get_index(key)
    bucket = @buckets[index]

    # Check if key exists and update value
    bucket.each_with_index do |pair, i|
      if pair[0] == key
        bucket[i][1] = value
        return
      end
    end

    # If key doesn't exist, add new pair
    bucket << [key, value]
    @size += 1
  end

  def get(key)
    index = get_index(key)
    bucket = @buckets[index]

    bucket.each do |pair|
      return pair[1] if pair[0] == key
    end

    nil
  end

  def has?(key)
    index = get_index(key)
    bucket = @buckets[index]

    bucket.any? { |pair| pair[0] == key }
  end

  def remove(key)
    index = get_index(key)
    bucket = @buckets[index]

    bucket.each_with_index do |pair, i|
      if pair[0] == key
        @size -= 1
        return bucket.delete_at(i)[1]
      end
    end

    nil
  end

  def length
    @size
  end

  def clear
    @capacity = 16
    @size = 0
    @buckets = Array.new(@capacity) { [] }
  end

  def keys
    result = []
    @buckets.each do |bucket|
      bucket.each { |pair| result << pair[0] }
    end
    result
  end

  def values
    result = []
    @buckets.each do |bucket|
      bucket.each { |pair| result << pair[1] }
    end
    result
  end

  def entries
    result = []
    @buckets.each do |bucket|
      bucket.each { |pair| result << pair }
    end
    result
  end

  private

  def get_index(key)
    hash_code = hash(key)
    index = hash_code % @capacity
    raise IndexError if index.negative? || index >= @buckets.length
    index
  end

  def should_resize?
    (@size.to_f / @capacity) >= @load_factor
  end

  def resize
    old_buckets = @buckets
    @capacity *= 2
    @size = 0
    @buckets = Array.new(@capacity) { [] }

    # Rehash all existing entries
    old_buckets.each do |bucket|
      bucket.each do |pair|
        set(pair[0], pair[1])
      end
    end
  end
end
