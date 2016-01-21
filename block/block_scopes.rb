# 关于作用域的一些小例子

my_var  = 'sth_be_wanted_to_show_in_class_and_method'
class BlockScopes
  v2 = 2
  v1 = 1
  @scope_one = local_variables
  p @scope_one

  def method_one
    v3 = 3
    @scope_two = local_variables
    p @scope_two
    yield('JJ')
  end
end

# 一.ｘ穿越作用域
# example_one
# 当　ｘ　的变量穿越作用域到达　块
x = 'sb'
c= BlockScopes.new
value =c.method_one { |you| "#{you} is #{x}"}
p value


# 二. 看清作用域
# scope_one scope_two 的值是：
# [:v2, :v1], [:v3]



# 三. 扁平化作用域
# 例如：
# class Myclass
#   # 你想在这里打印: my_var
#   def my_method
#     # 你还想在在这里打印: my_var
#   end
# end

puts '扁平化作用域例子的运行结果××××××××××××××××××××××××××××××××××××××'

MyClass = Class.new {
  p "在MyClass内部打印： #{my_var}"

  define_method :my_method do
    p "在my_method内部打印： #{my_var}"
  end
}
MyClass.new.my_method

puts ''


# 四. 共享作用域
# 动态定义方法个＆＆共享作用域

p '共享作用域的运行结果××××××××××××××××××××××××××××××××××××××'
def define_methods
  share = 0
  Kernel.send :define_method, :count do
    share
  end
  Kernel.send :define_method, :count_add do |x|
    share += x
  end
end

define_methods
p count
count_add(4)
p count


















