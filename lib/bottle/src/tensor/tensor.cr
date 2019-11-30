require "../base/base"
require "../base/print"
require "../arrayops/math"
require "../arrayops/binary"
require "../arrayops/statistics"
require "../macros/numeric"
require "./iter"
require "complex"
require "../libs/cblas"

struct Bottle::Tensor(T) < Bottle::BaseArray(T)
  # Compile time checking of data types of a `Tensor` to ensure
  # mixing data types is not allowed, not are bad data types
  # allowed into the `Tensor`
  getter basetype = Tensor

  def basetype(t : U.class) forall U
    Tensor(U)
  end

  def to_unsafe
    {% if T == Complex %}
      buffer.unsafe_as(Pointer(LibCblas::ComplexDouble))
    {% else %}
      buffer
    {% end %}
  end

  protected def check_type
    {% unless T == Float32 || T == Float64 || T == Int16 || T == Int32 || \
                 T == Int8 || T == UInt16 || T == UInt32 || T == UInt64 || \
                 T == UInt8 || T == Bool || T == Complex %}
      {% raise "Bad dtype: #{T}. #{T} is not supported for Char Arrays" %}
    {% end %}
  end

  # A flexible method to create `Tensor`'s of arbitrary shapes
  # filled with random values of arbitrary types.  Since
  # Ranges can contain any dtype, the type of tensor is
  # inferred from the passed range, and a new `Tensor` is
  # sampled using the provided shape.
  #
  # ```
  # t = Tensor.random(0...10, [2, 2])
  # t # =>
  # Tensor([[5, 9],
  #         [3, 9]])
  # ```
  def self.random(r : Range(U, U), _shape : Array(Int32)) forall U
    if _shape.size == 0
      Tensor(U).new(_shape)
    else
      new(_shape) { |_| Random.rand(r) }
    end
  end

  def self.from_array(_shape : Array(Int32), _data : Array)
    flat = _data.flatten
    ptr = flat.to_unsafe
    Testing.assert_compatible_shape(_shape, flat.size)
    if _shape.size == 0
      Tensor(typeof(flat[0])).new(_shape)
    else
      new(_shape) { |i| ptr[i] }
    end
  end

  # Creates a string representation of a `Tensor`.  The implementation
  # of this is a bit of a mess, but I am happy with the results currently,
  # it could however be cleaned up to handle long floating point values
  # more precisely.
  def to_s(io)
    maxlength = 0
    {% if T == Bool %}
      maxlength = 5
    {% elsif T == Complex %}
      maxlength = 15
    {% else %}
      maxlength = "#{max.round(3)}".size + 1
    {% end %}
    printer = ToString::BasePrinter.new(self, io, "Tensor", maxlength)
    printer.print
  end

  def inspect(io)
    io << "Tensor(shape=#{shape}, dtype#{T})"
  end

  def matrix_iter
    MatrixIter.new(self)
  end

  private def triu2d(a : Tensor(T), k)
    m, n = a.shape
    a.flat_iter_indexed do |el, idx|
      i = idx // n
      j = idx % n
      if i > j - k
        el.value = T.new(0)
      end
    end
  end

  private def tril2d(a : Tensor(T), k)
    m, n = a.shape
    a.flat_iter_indexed do |el, idx|
      i = idx // n
      j = idx % n
      if i < j - k
        el.value = T.new(0)
      end
    end
  end

  def triu!(k = 0)
    if ndims == 2
      triu2d(self, k)
    else
      matrix_iter.each do |subm|
        triu2d(subm, k)
      end
    end
  end

  def tril!(k = 0)
    if ndims == 2
      tril2d(self, k)
    else
      matrix_iter.each do |subm|
        tril2d(subm, k)
      end
    end
  end

  Macros.has_numeric_ops(Tensor)
  Macros.has_shift_ops(Tensor)
  Macros.has_bitwise_ops(Tensor)
  Macros.has_comparison_ops(Tensor)
  Macros.has_statistical_ops(Tensor)
  Macros.has_reduction_ops(Tensor)

  def real
    {% if T == Complex %}
      ret = Tensor(Float64).new(shape)
      ret.flat_iter.zip(flat_iter) do |i, j|
        i.value = j.value.real
      end
      ret
    {% else %}
      raise Exceptions::TypeError.new("Tensor is not complex")
    {% end %}
  end

  def imag
    {% if T == Complex %}
      ret = Tensor(Float64).new(shape)
      ret.flat_iter.zip(flat_iter) do |i, j|
        i.value = j.value.imag
      end
      ret
    {% else %}
      raise Exceptions::TypeError.new("Tensor is not complex")
    {% end %}
  end
end
