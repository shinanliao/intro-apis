require "http"

system "clear"

while true
  puts "Welcome to the dictionary app! Please enter a word: (Type Q when done!)"

  word = gets.chomp
  if word == "Q"
    break
  elsif

definition = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/definitions?limit=200&includeRelated=false&useCanonical=false&includeTags=false&api_key=03pgsw5yqhr4za5ql3604lcnwwdhwyznzog38048pue6ca6qy")

pronunciation = HTTP.get("https://api.wordnik.com/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=03pgsw5yqhr4za5ql3604lcnwwdhwyznzog38048pue6ca6qy")

definition_info = definition.parse
pronunciation_info = pronunciation.parse

definition_response = definition_info[0]["text"]
pronunciation_response = pronunciation_info[0]["raw"]

p "Your word means: #{definition_response} and it's pronounced #{pronunciation_response}."
  end
# end