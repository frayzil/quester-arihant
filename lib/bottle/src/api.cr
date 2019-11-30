require "./arrayops/binary"
require "./arrayops/build"
require "./arrayops/math"
require "./arrayops/trig"
require "./arrayops/io"
require "./arrayops/search"
require "./arrayops/extensions"
require "./tensor/tensor"
require "./tensor/linalg"
require "./fft/real"
require "./financial/simple"
require "./tensor/creation"
require "./sparse/coo"

module Bottle::B
  extend self
  include Bottle::Binary
  include Bottle::BMath
  include Bottle::Creation
  include Bottle::Statistics
  include Bottle::Trigonometry
  include Bottle::Assemble
  include Bottle::InputOutput
  include Bottle::Search
  include Bottle::FFT
  include Bottle::Financial
  include Bottle::Sparse
end
