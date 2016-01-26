# Proc 相关 Proc.new, proc(), lambda()
# 块不是对象；　如果需要将块存储起来供以后执行，可以通过proc将块转发为对象。这种技术称为延迟执行(Deferred Evaluation )
# lambda 比较常用,原因是return关键字的有些差异


#eg.1
inc_one = Proc.new do |x|
  x * 123
end
inc_two = proc do |x|
  x* 123
end
inc_three = lambda do |x|
  x * 123
end

puts 'eg.1:', inc_one.call(2), inc_two.call(2), inc_three.call(2), ''

#

