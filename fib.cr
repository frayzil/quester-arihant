#fib.cr


require "bottle"

#p Bottle::VERSION

include Bottle

#B = Bottle
#puts B.ones([2, 3])
#x = B.arange(10)

z = T.matmul(B.ones([5, 3]), B.ones([3, 2]))
puts z