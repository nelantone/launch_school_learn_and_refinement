# Matching Parentheses?
# Write a method that takes a string as argument, and returns true if all
# parentheses in the string are properly balanced, false otherwise. To be
# properly balanced, parentheses must occur in matching '(' and ')' pairs.

=begin
- Problem understanding:
  - mental model: return true if a string argument is balanced so,
  inside the all parentheses `(` `)`` are pair values
  - input: string
  - output: boolean
  - rules:
    - explicit:
      - to be balanced `(` `)` parentheses must occur in matching '(' and ')'
        pairs.
    -implicit:
      - seem to does not count empty spaces as values
      - it can be nested parentheses and count as chars.
- Examples(below)
- Data structure:
  arrays
- Algorithm:
  - find the first left parentheses on the array and the closed one.
  - remove the  empty spaces
  - count. if it an even number size continue
  - if is not even return false
  - repeat with all the formed parentheses
  * be aware that nested parentheses count as chars
- Code:
=end

def balanced?(string)
  matchars = string.scan(/\(.*\)|\[.*\]|\".*\"|\'.*\'|\{.*\}/)

  if matchars.empty? && (/\)|\(|\[|\]|\"|\'|\{|\}/).match?(string)
    return false
  elsif matchars.empty?
    return true
  else
    pairchars = matchars.map {|c| c.scan(/\)|\(|\[|\]|\"|\'|\{|\}/)}.flatten

    pairchars.size.even? ? true : false
  end
end

# Examples:
balanced?('What (is) this?') == true
balanced?('What is) this?') == false
balanced?('What (is this?') == false
balanced?('((What) (is this))?') == true
balanced?('((What)) (is this))?') == false
balanced?('Hey!') == true
balanced?(')Hey!(') == false
balanced?('What ((is))) up(') == false
# Note that balanced pairs must each start with a (, not a ).

# Further Exploration
# There are a few other characters that should be matching as well.
# Square brackets and curly brackets normally come in pairs. Quotation
# marks(single and double) also typically come in pairs and should be
# balanced. Can you expand this method to take into account those characters?
balanced?("¿[{'{{is}}'}]?") == true
balanced?(" is") == true
balanced?('¿[is]?') == true
balanced?('¿"is"?') == true
balanced?("¿'is'?") == true
balanced?("¿{is}?") == true
balanced?("¿{i}?") == true
balanced?("¿is}?") == false
balanced?("¿{is?") == false
balanced?("¿'is?") == false
balanced?("¿is'?") == false
balanced?("¿'s'?") == true
balanced?('¿"is?') == false
balanced?('¿is"?') == false
balanced?('¿"s"?') == true
balanced?("¿[i]?") == true
balanced?("¿is]?") == false
balanced?("¿[is?") == false
