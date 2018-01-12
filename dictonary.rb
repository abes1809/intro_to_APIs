require "unirest"
system "clear"

looking_up_words = true

while looking_up_words

  puts "Enter a word!"
  word = gets.chomp
  puts 
  puts "-" * 40 

    
  response_definition = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{word}/definitions?limit=10&includeRelated=true&useCanonical=false&includeTags=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")
    
  definitions = response_definition.body
    
  puts "DEFINITIONS"
  puts "-" * 40
    
  definitions.each.with_index do |definition, index|
    puts "#{index + 1} - #{definition["text"]}"
  end  
  puts "-" * 40
  puts
  puts
    
  response_top_example = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{word}/topExample?useCanonical=false&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")
    
  top_example = response_top_example.body
    
  puts "TOP EXAMPLE"
  puts "-" * 40
    
  puts top_example["text"]
    
  puts "-" * 40
  puts
  puts
    
    
  response_pronunciation = Unirest.get("http://api.wordnik.com:80/v4/word.json/#{word}/pronunciations?useCanonical=false&limit=50&api_key=a2a73e7b926c924fad7001ca3111acd55af2ffabf50eb4ae5")
    
  pronunciations = response_pronunciation.body
    
  puts "PRONUNCIATIONS"
  puts "-" * 40
  first_pronunciation = pronunciations[0]
    
  # if first_pronunciation
  #   puts first_pronunciation["raw"]
  # end 
    
  pronunciations.each.with_index do |pronunciation, index|
    puts "#{index + 1} - #{pronunciation["raw"]}"
    puts 
  end

  puts "presse enter to look up another word, otherwise press Q to exit"

  user_input = gets.chomp

  if user_input == "Q"
    looking_up_words = false
  end 
end 

system "clear"
puts "Thanks for looking up words with me"









