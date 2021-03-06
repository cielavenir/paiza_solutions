//usr/bin/env swift $0 $@;exit

#if os(OSX)
//_runtime(_ObjC)

#else

//import CoreFoundation
// even if not using ObjC runtime, withValist() is possible.

/// Instances of conforming types can be encoded, and appropriately
/// passed, as elements of a C `va_list`.
///
/// This protocol is useful in presenting C "varargs" APIs natively in
/// Swift.  It only works for APIs that have a `va_list` variant, so
/// for example, it isn't much use if all you have is:
///
///     int f(int n, ...)
///
/// Given a version like this, though,
///
///     int f(int, va_list arguments)
///
/// you can write:
///
///     func swiftF(x: Int, arguments: CVarArgType...) -> Int {
///       return withVaList(arguments) { f(x, $0) }
///     }
public protocol CVarArgType {
  // Note: the protocol is public, but its requirement is stdlib-private.
  // That's because there are APIs operating on CVarArgType instances, but
  // defining conformances to CVarArgType outside of the standard library is
  // not supported.

  /// Transform `self` into a series of machine words that can be
  /// appropriately interpreted by C varargs.
  var _cVarArgEncoding: [Int] { get }
}

/// Floating point types need to be passed differently on x86_64
/// systems.  CoreGraphics uses this to make CGFloat work properly.
public // SPI(CoreGraphics)
protocol _CVarArgPassedAsDouble : CVarArgType {}

/// Some types require alignment greater than Int on some architectures.
public // SPI(CoreGraphics)
protocol _CVarArgAlignedType : CVarArgType {
  /// Return the required alignment in bytes of 
  /// the value returned by `_cVarArgEncoding`.
  var _cVarArgAlignment: Int { get }
}

#if arch(x86_64)
let _x86_64CountGPRegisters = 6
let _x86_64CountSSERegisters = 8
let _x86_64SSERegisterWords = 2
let _x86_64RegisterSaveWords = _x86_64CountGPRegisters + _x86_64CountSSERegisters * _x86_64SSERegisterWords
#endif

/// Invoke `f` with a C `va_list` argument derived from `args`.
public func withVaList<R>(args: [CVarArgType],
  _ f: CVaListPointer -> R) -> R {
  let builder = VaListBuilder()
  for a in args {
    builder.append(a)
  }
  return withVaList(builder, f)
}

/// Invoke `f` with a C `va_list` argument derived from `builder`.
public func withVaList<R>(builder: VaListBuilder,
  _ f: CVaListPointer -> R) -> R {
#if arch(x86_64)
  builder.header.reg_save_area = builder.storage._baseAddressIfContiguous
  builder.header.overflow_arg_area
    = builder.storage._baseAddressIfContiguous + _x86_64RegisterSaveWords
  let result = withUnsafeMutablePointer(&builder.header) {
    return f(CVaListPointer(_fromUnsafeMutablePointer:$0))
  }
#else
  let result = withUnsafeMutablePointer(&builder.storage) {
    return f(CVaListPointer(_fromUnsafeMutablePointer:$0))
  }
#endif
  _fixLifetime(builder)
  return result
}

@warn_unused_result
public func _encodeBitsAsWords<T : CVarArgType>(x: T) -> [Int] {
  let result = [Int](
    count: (sizeof(T.self) + sizeof(Int.self) - 1) / sizeof(Int.self),
    repeatedValue: 0)
  var tmp = x
  withUnsafeMutablePointer(&tmp) {
    UnsafeMutablePointer(result._baseAddressIfContiguous).assignFrom($0,count:sizeof(T.self)/sizeof(Int.self))
  }
  return result
}

// CVarArgType conformances for the integer types.  Everything smaller
// than a CInt must be promoted to CInt or CUnsignedInt before
// encoding.

// Signed types
extension Int : CVarArgType {
  /// Transform `self` into a series of machine words that can be
  /// appropriately interpreted by C varargs.
  public var _cVarArgEncoding: [Int] {
    return _encodeBitsAsWords(self)
  }
}

extension Int64 : CVarArgType, _CVarArgAlignedType {
  /// Transform `self` into a series of machine words that can be
  /// appropriately interpreted by C varargs.
  public var _cVarArgEncoding: [Int] {
    return _encodeBitsAsWords(self)
  }

  /// Return the required alignment in bytes of 
  /// the value returned by `_cVarArgEncoding`.
  public var _cVarArgAlignment: Int {
    // FIXME: alignof differs from the ABI alignment on some architectures
    return alignofValue(self)
  }
}

extension Int32 : CVarArgType {
  /// Transform `self` into a series of machine words that can be
  /// appropriately interpreted by C varargs.
  public var _cVarArgEncoding: [Int] {
    return _encodeBitsAsWords(self)
  }
}

extension Int16 : CVarArgType {
  /// Transform `self` into a series of machine words that can be
  /// appropriately interpreted by C varargs.
  public var _cVarArgEncoding: [Int] {
    return _encodeBitsAsWords(CInt(self))
  }
}

extension Int8 : CVarArgType {
  /// Transform `self` into a series of machine words that can be
  /// appropriately interpreted by C varargs.
  public var _cVarArgEncoding: [Int] {
    return _encodeBitsAsWords(CInt(self))
  }
}

// Unsigned types
extension UInt : CVarArgType {
  /// Transform `self` into a series of machine words that can be
  /// appropriately interpreted by C varargs.
  public var _cVarArgEncoding: [Int] {
    return _encodeBitsAsWords(self)
  }
}

extension UInt64 : CVarArgType, _CVarArgAlignedType {
  /// Transform `self` into a series of machine words that can be
  /// appropriately interpreted by C varargs.
  public var _cVarArgEncoding: [Int] {
    return _encodeBitsAsWords(self)
  }

  /// Return the required alignment in bytes of 
  /// the value returned by `_cVarArgEncoding`.
  public var _cVarArgAlignment: Int {
    // FIXME: alignof differs from the ABI alignment on some architectures
    return alignofValue(self)
  }
}

extension UInt32 : CVarArgType {
  /// Transform `self` into a series of machine words that can be
  /// appropriately interpreted by C varargs.
  public var _cVarArgEncoding: [Int] {
    return _encodeBitsAsWords(self)
  }
}

extension UInt16 : CVarArgType {
  /// Transform `self` into a series of machine words that can be
  /// appropriately interpreted by C varargs.
  public var _cVarArgEncoding: [Int] {
    return _encodeBitsAsWords(CUnsignedInt(self))
  }
}

extension UInt8 : CVarArgType {
  /// Transform `self` into a series of machine words that can be
  /// appropriately interpreted by C varargs.
  public var _cVarArgEncoding: [Int] {
    return _encodeBitsAsWords(CUnsignedInt(self))
  }
}

extension COpaquePointer : CVarArgType {
  /// Transform `self` into a series of machine words that can be
  /// appropriately interpreted by C varargs.
  public var _cVarArgEncoding: [Int] {
    return _encodeBitsAsWords(self)
  }
}

extension UnsafePointer : CVarArgType {
  /// Transform `self` into a series of machine words that can be
  /// appropriately interpreted by C varargs.
  public var _cVarArgEncoding: [Int] {
    return _encodeBitsAsWords(self)
  }
}

extension UnsafeMutablePointer : CVarArgType {
  /// Transform `self` into a series of machine words that can be
  /// appropriately interpreted by C varargs.
  public var _cVarArgEncoding: [Int] {
    return _encodeBitsAsWords(self)
  }
}

extension Float : _CVarArgPassedAsDouble, _CVarArgAlignedType {
  /// Transform `self` into a series of machine words that can be
  /// appropriately interpreted by C varargs.
  public var _cVarArgEncoding: [Int] {
    return _encodeBitsAsWords(Double(self))
  }

  /// Return the required alignment in bytes of 
  /// the value returned by `_cVarArgEncoding`.
  public var _cVarArgAlignment: Int {
    // FIXME: alignof differs from the ABI alignment on some architectures
    return alignofValue(Double(self))
  }
}

extension Double : _CVarArgPassedAsDouble, _CVarArgAlignedType {
  /// Transform `self` into a series of machine words that can be
  /// appropriately interpreted by C varargs.
  public var _cVarArgEncoding: [Int] {
    return _encodeBitsAsWords(self)
  }

  /// Return the required alignment in bytes of 
  /// the value returned by `_cVarArgEncoding`.
  public var _cVarArgAlignment: Int {
    // FIXME: alignof differs from the ABI alignment on some architectures
    return alignofValue(self)
  }
}

#if !arch(x86_64)

/// An object that can manage the lifetime of storage backing a
/// `CVaListPointer`.
final public class VaListBuilder {

  func append(arg: CVarArgType) {
    // Write alignment padding if necessary.
    // This is needed on architectures where the ABI alignment of some 
    // supported vararg type is greater than the alignment of Int.
    // FIXME: this implementation is not portable because
    // alignof differs from the ABI alignment on some architectures
#if os(watchOS) && arch(arm)   // FIXME: rdar://21203036 should be arch(armv7k)
    if let arg = arg as? _CVarArgAlignedType {
      let alignmentInWords = arg._cVarArgAlignment / sizeof(Int)
      let misalignmentInWords = count % alignmentInWords
      if misalignmentInWords != 0 {
        let paddingInWords = alignmentInWords - misalignmentInWords
        appendWords([Int](count: paddingInWords, repeatedValue: -1))
      }
    }
#endif

    // Write the argument's value itself.
    appendWords(arg._cVarArgEncoding)
  }

  // Manage storage that is accessed as Words 
  // but possibly more aligned than that.
  // FIXME: this should be packaged into a better storage type

  func appendWords(words: [Int]) {
    let newCount = count + words.count
    if newCount > allocated {
      let oldAllocated = allocated
      let oldStorage = storage
      let oldCount = count

      allocated = max(newCount, allocated * 2)
      storage = allocStorage(wordCount: allocated)
      // count is updated below

      if oldStorage != nil {
        storage.moveInitializeFrom(oldStorage, count:oldCount)
        deallocStorage(wordCount: oldAllocated, 
          storage: oldStorage)
      }
    }

    for word in words {
      storage[count++] = word
    }
  }

  @warn_unused_result
  func rawSizeAndAlignment(wordCount: Int) -> (Builtin.Word, Builtin.Word) {
    return ((wordCount * strideof(Int.self))._builtinWordValue, 
      requiredAlignmentInBytes._builtinWordValue)
  }

  @warn_unused_result
  func allocStorage(wordCount wordCount: Int) -> UnsafeMutablePointer<Int> {
    let (rawSize, rawAlignment) = rawSizeAndAlignment(wordCount)
    let rawStorage = Builtin.allocRaw(rawSize, rawAlignment)
    return UnsafeMutablePointer<Int>(rawStorage)
  }

  func deallocStorage(
    wordCount wordCount: Int,
    storage: UnsafeMutablePointer<Int>
  ) {
    let (rawSize, rawAlignment) = rawSizeAndAlignment(wordCount)
    Builtin.deallocRaw(storage._rawValue, rawSize, rawAlignment)
  }

  deinit {
    if storage != nil {
      deallocStorage(wordCount: allocated, storage: storage)
    }
  }

  // FIXME: alignof differs from the ABI alignment on some architectures
  let requiredAlignmentInBytes = alignof(Double.self)
  var count = 0
  var allocated = 0
  var storage: UnsafeMutablePointer<Int> = nil
}

#else

/// An object that can manage the lifetime of storage backing a
/// `CVaListPointer`.
final public class VaListBuilder {

  struct Header {
    var gp_offset = CUnsignedInt(0)
    var fp_offset = CUnsignedInt(_x86_64CountGPRegisters * strideof(Int.self))
    var overflow_arg_area: UnsafeMutablePointer<Int> = nil
    var reg_save_area: UnsafeMutablePointer<Int> = nil
  }

  init() {
    // prepare the register save area
    storage = Array(count: _x86_64RegisterSaveWords, repeatedValue: 0)
  }

  func append(arg: CVarArgType) {
    var encoded = arg._cVarArgEncoding

    if arg is _CVarArgPassedAsDouble
      && sseRegistersUsed < _x86_64CountSSERegisters {
      var startIndex = _x86_64CountGPRegisters
           + (sseRegistersUsed * _x86_64SSERegisterWords)
      for w in encoded {
        storage[startIndex] = w
        ++startIndex
      }
      ++sseRegistersUsed
    }
    else if encoded.count == 1 && gpRegistersUsed < _x86_64CountGPRegisters {
      storage[gpRegistersUsed++] = encoded[0]
    }
    else {
      for w in encoded {
        storage.append(w)
      }
    }
  }

  var gpRegistersUsed = 0
  var sseRegistersUsed = 0

  final  // Property must be final since it is used by Builtin.addressof.
  var header = Header()
  var storage: [Int]
}

#endif

#endif // _runtime(_ObjC)

import CoreFoundation

func getInt()->Int{
	var n:Int=0
	_=withUnsafeMutablePointer(to:&n){withVaList([OpaquePointer($0)]){vscanf("%d",$0)}}
	return n
}

var n=getInt()
for var i in 0..<n {
    print("Ann",terminator:"")
}
