require_relative "safe_file_reader"
require_relative "json_store"

puts "--- SafeFileReader demo ---"
content = SafeFileReader.read("step5/sample.txt")
puts(content.nil? ? "content is nil" : content)

puts "\n--- JsonStore demo ---"
store = JsonStore.new("step5/data.json")

items = store.load_array
puts "loaded items: #{items.inspect}"

new_items = items + [{ id: 1, title: "learn rescue/ensure", done: false}]
saved = store.save_array(new_items)
puts "saved?: #{saved}"

reloaded = store.load_array
puts "reloaded items: #{reloaded.inspect}"