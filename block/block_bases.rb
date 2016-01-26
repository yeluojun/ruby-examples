# 块的一些用法
# 关键字 yield 返回一个块的结果
class A
  def method_one(a, b)
    a = a + b
    return yield(a) if block_given?
    'no block'
  end
end

# eg1:
# when it is exist a block
# b should be 6
b = A.new.method_one(2,4) do |a|
  a
end
puts 'eg1:', "b should be #{b}", ''

# eg2:
# when it is no exist a block
# c should be no block
c = A.new.method_one(2,4)
p 'eg2:', "c should be #{c}", ''