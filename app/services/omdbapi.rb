# Service to connect to the Ombdapi service
class Omdbapi
  include HTTParty
  base_uri 'http://www.omdbapi.com'

  def self.search(word, year)
    get "?apikey=#{ENV['OMDBAPI_KEY']}&s=#{word}&y=#{year}"
  rescue => _e
    { 'Response' => 'False', 'Error' => 'Omdbapi service error' }
  end

  def self.analyse(res)
    all_words = {}
    res['Search'].each do |film|
      words = film['Title'].downcase.split(/\W+/)
      words.each do |word|
        next unless word =~ /[a-z]+/ # Only process words
        all_words[word] = 1 unless all_words[word]
        all_words[word] += 1 if all_words[word]
      end
    end
    all_words.sort_by { |_word, num| num }.reverse.to_h
  end
end
