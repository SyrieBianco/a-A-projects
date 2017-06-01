#warm up

#1
def rec_range (r)

end

#2
def rec_sum (arr)
  return arr.first if arr.length <= 1
  arr[0] + r_sum(arr[1..-1])
end

#3
def iter_sum (arr)
  arr.reduce(:+)
end


# Exponentiation



def exponent_1(b, e)
  return 1 if e.zero?
  b * exponent_1(b, e - 1)
end


def exponent_2(b, e)
  return 1 if e.zero?
  return b if e == 1
  if e.even?
    exponent_2(b, e / 2) * exponent_2(b, e / 2)
  else
    b * (exponent_2(b, (n - 1) / 2) * exponent_2(b, (n - 1) / 2))
  end
end

# Deep Dup

def deep_dup(arr)
  return arr.dup if arr.none? { |el| el.is_a?(Array) }
  arr.each do |el|
    next unless el.is_a?(Array)
    deep_dup(el)
end

# Fibonacci

def rec_fib(n)
  seq = [0, 1]
  n <= 2 ? seq[0...n] : rec_fib(n-1) << rec_fib(n-1)[-2..-1].reduce(:+)
end
## when I have it print each recursion it repeats in a weird pattern.. why?
## does it mean my solution is inelegant?

def iter_fib(n)
  seq = [0, 1]

  return seq[0...n] unless n > 2

  until seq.length == n
    seq << seq[-1] + seq[-2]
  end

  seq
end

# Array Subsets

def array_subsets(arr)
  return [[]] if arr.length.zero?
  subsets = array_subsets( arr.take(arr.length - 1))
  subsets += subsets.map { |set| set + [arr.last] }
  subsets
end

# Permutations

def permutations(arr)
  return [arr] if arr.length == 1
  perms = permutations(arr.take(arr.length-1))
  all_permutes = []
  perms.each do | perm |
    perm.each_index do | i |
      all_permutes << perm.insert(i,arr.last)
    end
  end

  all_permutes
end
#its looping! Halp!
