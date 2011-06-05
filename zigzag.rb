#! /usr/bin/ruby

def get_permutations(n)
  start = (1..n).to_a
  start.permutation.to_a
end

def zigzag?(a)
  zigzag = true
  s = a.size
  (0..(s-2)).step(2).each do |i|
    next unless a[i+2]
    unless a[i+1] > a[i] and a[i+2] < a[i+1]
      zigzag = false
      break 
    end
  end
  zigzag
end

def swap(a,i,j)
  a[i], a[j] = a[j],a[i]
end

def zigzag(a)
  a = a.clone
  s = a.size
  (0..(s-2)).step(2).each do |i|
    if a[i] > a[i+1]
      swap(a, i, i+1)
    end
    
    if a[i+2] and a[i+1] < a[i+2]
      swap(a, i+1, i+2)
    end
  end
  a
end

n=10

perms = get_permutations(n)
puts perms.size

perms.each do |p|
  z = zigzag(p)
  iz = zigzag? z
  unless iz
    print p.inspect
    print " "
    print z.inspect
    print " "
    puts "false"
    break
  end
end

