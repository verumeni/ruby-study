# Procをコールバックとして受け取る

def process_items(items, handler)
 items.map {|item| handler.call(item)}
end

upcase_proc = ->(s) {s.upcase}
length_proc = ->(s) {s.length}

words = %w[ruby proc lambda]

puts process_items(words, upcase_proc).inspect
puts process_items(words, length_proc).inspect