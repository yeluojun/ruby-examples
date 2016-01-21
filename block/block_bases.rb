class A
  def method_one(a, b)
    a = a + b
    return yield(a) if block_given?
    'no block'
  end
end

# when it is exist a block
# b should be 6
b = A.new.method_one(2,4) do |a|
  a
end
p "b should be #{b}"


# when it is no exist a block
# c should be no block
c = A.new.method_one(2,4)
p "c should be #{c}"