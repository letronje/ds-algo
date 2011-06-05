#! /usr/bin/ruby

def get_permutations(n)
  (1..n).to_a.permutation.to_a
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


=begin
Algo by "Divya Kunnath"

- Makes sure that the zigzag sequence starts with an ascend ( /\/\/\/\/\/\/\..... )
- Compares every triplet to make sure that they form a /\ pattern(ascend followed by a descend)

=end

def zigzagify(a)
  a = a.clone
  s = a.size
  (0..(s-2)).step(2).each do |i|
    #Making sure there is an ascend
    if a[i] > a[i+1]
      swap(a, i, i+1)
    end
    
    #Making sure there is a descend
    if a[i+2] and a[i+1] < a[i+2]
      swap(a, i+1, i+2)
    end
  end
  a
end

n=8

perms = get_permutations(n)
puts "Num permutations = #{perms.size}"

perms.each do |p|
  z = zigzagify p
  unless zigzag? z
    puts "#{p.inspect} #{z.inspect} => false"
    break
  end
end

