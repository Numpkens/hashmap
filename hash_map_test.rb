require_relative 'hash_map'  # Make sure this points to your HashMap implementation file

# Create new instance with load factor 0.75
test = HashMap.new

# Populate the hash map
puts "\nPopulating hash map..."
test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

puts "Current length: #{test.length}"  # Should be 12
puts "Current entries:"
p test.entries

# Test overwriting existing values
puts "\nTesting overwriting values..."
test.set('apple', 'dark red')
test.set('banana', 'bright yellow')
puts "Length after overwriting: #{test.length}"  # Should still be 12
puts "Updated values:"
puts "apple: #{test.get('apple')}"      # Should print 'dark red'
puts "banana: #{test.get('banana')}"    # Should print 'bright yellow'

# Add new entry to trigger resize
puts "\nAdding 'moon' to trigger resize..."
test.set('moon', 'silver')
puts "Length after adding moon: #{test.length}"  # Should be 13

# Test other methods
puts "\nTesting other methods:"
puts "Has 'apple'?: #{test.has?('apple')}"
puts "Has 'nothere'?: #{test.has?('nothere')}"

puts "\nAll keys:"
p test.keys

puts "\nAll values:"
p test.values

puts "\nRemoving 'apple'..."
removed_value = test.remove('apple')
puts "Removed value: #{removed_value}"
puts "Length after removal: #{test.length}"
puts "Has 'apple'?: #{test.has?('apple')}"

puts "\nAll entries before clear:"
p test.entries

puts "\nClearing hash map..."
test.clear
puts "Length after clear: #{test.length}"
puts "Entries after clear:"
p test.entries
