# eigenclass

## 一. 定义

  单间类,　是对象真正的类, 每个实例拥有一个eigenclass, eigenclass也有自己的eigenclass
```ruby
class C
  def a_method
    'C#a_method()'
  end
end

class D < C
end

obj = D.new
obj.a_method #=> 'C#a_method()'

d_eigen = class << obj
  self
end

puts d_eigen.superclass #=> D

class << d_eigen  # eigenclass也有自己的eigenclass
  self 
end
```