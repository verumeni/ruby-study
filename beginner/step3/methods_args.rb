def introduce(name, age = 20)
    "name=#{name}, age=#{age}"
end

puts introduce("Hanako")
puts introduce("Jiro", 31)

def build_profile(name:, age:, city: "Tokyo")
    {
        name: name,
        age: age,
        city: city
    }
end

profile1 = build_profile(name: "Taro", age: 30)
profile2 = build_profile(name: "Yuki", age: 27, city: "Osaka")

puts "profile1: #{profile1}"
puts "profile2: #{profile2}"