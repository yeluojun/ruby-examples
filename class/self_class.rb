# 当前类，self相关的一些东西
# ｃlass_eval  的一些方法
# 当通过关键字class（module）来打开一个类,那么这个类就是当前类

#eg1. 当前类,
# self_class => 'MyClass'
self_class = class MyClass
  self
end
puts '当前类:', self_class, ''


# eg2. class_eval
class ClassEval
  def add_fund_to_a_class(arg_class)
    # arg_class.class_eval{ }
  end
end