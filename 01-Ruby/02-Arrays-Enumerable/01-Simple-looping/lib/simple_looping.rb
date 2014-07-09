def sum_with_while(min,max)
  i=0
  sum=0
  range=max-min
  while i <= range
    sum = sum + (min + i)
    i = i + 1
  end
  sum
end

def sum_with_for(min,max)
  i=0
  sum=0
  range=max-min
  for i in (0..range)
    sum = sum + (min + i)
    i = i + 1
  end
    sum
end

def sum_recursive(min,max)
  #TODO (optional): return the sum of the integers between min and max
  #CONSTRAINT: you should use a recursive algorithm, i.e. the method should call itself
  fail(ArgumentError) if min > max
  sum = min
  if min == max
    return max
  else
    min = min + 1
    sum = sum + sum_recursive(min,max)
  end
end

