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
  class << self
    def add_fund_to_a_class(arg_class, function)
      arg_class.class_eval do
        define_method function do
          'this is a test'
        end
      end
    end
  end
end
ClassEval.add_fund_to_a_class(String, 'finit')
puts 'class_eval:', 'abc'.finit, ''