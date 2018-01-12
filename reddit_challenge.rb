require "unirest"
system "clear"

# puts "What subreddit do you want to look up?"

# user_input_subreddit = gets.chomp

reddit = Unirest.get("https://www.reddit.com/r/nosleep/.json")

full_reddit = reddit.body 

subreddit = full_reddit["data"]["children"]["data"][0]

p subreddit