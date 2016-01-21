class BlockScopes

  def method_one
    x = 'fa ke you '
    yield('JJ')
  end

end

# example_one
# 当　ｘ　的变量穿越作用域到达　块里面
#  JJ is sb
x = 'sb'
value = BlockScopes.new.method_one { |you| "#{you} is #{x}"}
p value




