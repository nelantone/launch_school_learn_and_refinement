def ordinalize(century)
  return "#{century}th" if century.to_s.end_with?('11', '12', '13')

  case century % 10
  when 1 then "#{century}st"
  when 2 then "#{century}nd"
  when 3 then "#{century}rd"
  else "#{century}th"
  end
end

def century(number)
  century = (number.to_f / 100).to_s

  century.end_with?('0') ? century = century.to_i : century = century.to_i + 1

  ordinalize(century)
end

century(2000) == '20th'
century(2001) == '21st'
century(1965) == '20th'
century(256) == '3rd'
century(5) == '1st'
century(10103) == '102nd'
century(1052) == '11th'
century(1127) == '12th'
century(11201) == '113th'
