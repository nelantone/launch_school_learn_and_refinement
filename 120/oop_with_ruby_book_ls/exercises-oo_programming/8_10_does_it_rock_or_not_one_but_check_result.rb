# Does it Rock or Not?
# We discovered Gary Bernhardt's repository for finding out whether something rocks or not,
# and decided to adapt it for a simple example.

class AuthenticationError < Exception; end
class NoStringError < Exception; end

# A mock search engine
# that returns a random number instead of an actual count.
class SearchEngine
  def self.count(query, api_key)
    unless valid?(api_key)
      raise AuthenticationError, 'API key is not valid.'
    end

    unless string?(query)
      raise NoStringError, 'API query is not a string.'
    end

    # rand(200_000)
    query.size/10.0
  end

  private

  def self.valid?(key)
    key == 'LS1A'
  end

  def self.string?(query)
    query.class == String
  end
end

module DoesItRock
  API_KEY = 'LS1A'

  class NoScore; end

  class Score
    def self.for_term(term)
      # positive = SearchEngine.count(%{"#{term} rocks"}, API_KEY).to_f
      # negative = SearchEngine.count(%{"#{term} is not fun"}, API_KEY).to_f
      #
      # positive / (positive + negative)
      SearchEngine.count(term, API_KEY)
    rescue Exception
      NoScore
    end
  end

  def self.find_out(term)
    score = Score.for_term(term)

    return "No idea about #{term}..." if score == NoScore

    case score
    when 0...0.5
      "#{term} is not fun."
    when 0.5
      "#{term} seems to be ok..."
    else
      "#{term} rocks!"
    end
  rescue Exception => e
    e.message
  end
end

# Example (your output may differ)

puts DoesItRock.find_out('Sushi')       == 'Sushi seems to be ok...'
puts DoesItRock.find_out('Rain')        == 'Rain is not fun.'
puts DoesItRock.find_out('Bug hunting') == 'Bug hunting rocks!'
# In order to test the case when authentication fails, we can simply set API_KEY to any string other than the correct key.
# Now, when using a wrong API key, we want our mock search engine to raise an AuthenticationError, and we want the find_out
# method to catch this error and print its error message API key is not valid.
#
# Is this what you expect to happen given the code?
#
# Answer = No, the code before was giving a random value from 200_000
#
# And why do we always get the following output instead?
#  We make a strange operation before "positive / (positive + negative)"that in the en was a random number:
#  for example 2 / 2 - 2 = 2.. So it wll be always greater than one (as rand returns an absolute number).
# If we want the following errors we can mock result first leading with the ize string and then trying some edge cases.
# We also need to add:
# unless string?(query) ; raise NoStringError, 'API query is not a string.' ; end
# An relate methods classes etc... Also to take out  NoScore from the cases an ad it as a guard clause as it is a specific exception
puts DoesItRock.find_out(2) == "No idea about 2..."

# Sushi rocks!
# Rain rocks!
# Bug hunting rocks!
