# instance_eval(), instance_exec() 等的用法


class A
  define_method :no_used_method do
    'no_used_method'
  end

  def method_missing(method, *arg)
    "没有这个方法：#{method}"
  end

  private

  def private_method
    'private method'
  end
end

obj_one = A.new
obj_one.instance_eval do
  # self
  def method_three
    "HAVE method: method_three and it can access #{private_method}"
  end

  # 此个方式相当于定义类里面的方法。。。FIXME: WHY??
  Kernel.send :define_method, :method_one do |x|
    "HAVE method: method_one and result is #{x}"
  end
end

obj_one.instance_exec(1,3,5) do |x, y, z|
  Kernel.send :define_method, :method_two do |g|
    "HAVE method: method_two And result is #{ x + y + z + g }"
  end
end

obj_one_method_one_value = obj_one.method_one('instance_eval')
obj_one_method_two_value = obj_one.method_two(1)
obj_one_method_three_value = obj_one.method_three
puts 'obj_one ', obj_one_method_one_value, obj_one_method_two_value, obj_one_method_three_value, ''

# obj_one.method_three
obj_two = A.new
obj_two_method_one_value = obj_two.method_one('instance_eval')
obj_two_method_two_value = obj_two.method_two(1)
obj_two_method_three_value = obj_two.method_three
puts 'obj_two', obj_two_method_one_value, obj_two_method_two_value, obj_two_method_three_value


# just like:

# obj.instance_eval do
#   def a
#
#   end
# end

# 等于

# class << obj

#   def a
#
#   end
# end