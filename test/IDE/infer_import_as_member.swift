// RUN: %target-swift-ide-test(mock-sdk: %clang-importer-sdk) -I %t -I %S/Inputs/custom-modules -print-module -source-filename %s -module-to-print=InferImportAsMember -always-argument-labels -enable-infer-import-as-member > %t.printed.A.txt
// RUN: FileCheck %s -check-prefix=PRINT -strict-whitespace < %t.printed.A.txt

import InferImportAsMember

// TODO: more cases, eventually exhaustive, as we start inferring the result we
// want


// PRINT-LABEL: struct IAMStruct1 {
// PRINT-NEXT:    var x: Double
// PRINT-NEXT:    var y: Double
// PRINT-NEXT:    var z: Double
// PRINT-NEXT:    init()
// PRINT-NEXT:    init(x x: Double, y y: Double, z z: Double)
// PRINT-NEXT:  }

// PRINT-LABEL: extension IAMStruct1 {
// PRINT-NEXT:    static var globalVar: Double
//
// PRINT-LABEL:   /// Init
// PRINT-NEXT:    init(copyIn in: IAMStruct1)
// PRINT-NEXT:    init(simpleValue value: Double)
// PRINT-NEXT:    init(redundant redundant: Double)
//
// PRINT-LABEL:   /// Methods
// PRINT-NEXT:    func invert() -> IAMStruct1
// PRINT-NEXT:    mutating func invertInPlace()
// PRINT-NEXT:    func rotate(radians radians: Double) -> IAMStruct1
// PRINT-NEXT:    func selfComesLast(x x: Double)
// PRINT-NEXT:    func selfComesThird(a a: Double, b b: Float, x x: Double)
//
// PRINT-LABEL:   /// Properties
// PRINT-NEXT:    var radius: Double { get nonmutating set }
// PRINT-NEXT:    var altitude: Double
// PRINT-NEXT:    var magnitude: Double { get }
// PRINT-NEXT:    var length: Double
//
// PRINT-LABEL:   /// Various instance functions that can't quite be imported as properties.
// PRINT-NEXT:    func getNonPropertyNumParams() -> Float
// PRINT-NEXT:    func setNonPropertyNumParams(a a: Float, b b: Float)
// PRINT-NEXT:    func getNonPropertyType() -> Float
// PRINT-NEXT:    func setNonPropertyType(x x: Double)
// PRINT-NEXT:    func getNonPropertyNoSelf() -> Float
// PRINT-NEXT:    static func setNonPropertyNoSelf(x x: Double, y y: Double)
// PRINT-NEXT:    func setNonPropertyNoGet(x x: Double)
//
// PRINT-LABEL:   /// Various static functions that can't quite be imported as properties.
// PRINT-NEXT:    static func staticGetNonPropertyNumParams() -> Float
// PRINT-NEXT:    static func staticSetNonPropertyNumParams(a a: Float, b b: Float)
// PRINT-NEXT:    static func staticGetNonPropertyType() -> Float
// PRINT-NEXT:    static func staticSetNonPropertyType(x x: Double)
// PRINT-NEXT:    static func staticGetNonPropertyNoSelf() -> Float
// PRINT-NEXT:    static func staticSetNonPropertyNoSelf(x x: Double, y y: Double)
// PRINT-NEXT:    static func staticSetNonPropertyNoGet(x x: Double)
//
// PRINT-LABEL:   /// Static method
// PRINT-NEXT:    static func staticMethod() -> Double
// PRINT-NEXT:    static func tlaThreeLetterAcronym() -> Double
//
// PRINT-LABEL:   /// Static computed properties
// PRINT-NEXT:    static var staticProperty: Double
// PRINT-NEXT:    static var staticOnlyProperty: Double { get }
//
// PRINT-LABEL:   /// Omit needless words
// PRINT-NEXT:    static func onwNeedlessTypeArgLabel(_ Double: Double) -> Double
//
// PRINT-LABEL:   /// Fuzzy
// PRINT-NEXT:    init(fuzzy fuzzy: ())
// PRINT-NEXT:    init(fuzzyWithFuzzyName fuzzyWithFuzzyName: ())
// PRINT-NEXT:    init(fuzzyName fuzzyName: ())
// PRINT-NEXT:  }
//
// PRINT-NEXT:  func __IAMStruct1IgnoreMe(_ s: IAMStruct1) -> Double
//
// PRINT-LABEL: /// Mutable
// PRINT-NEXT:  struct IAMMutableStruct1 {
// PRINT-NEXT:    init()
// PRINT-NEXT:  }
// PRINT-NEXT:  extension IAMMutableStruct1 {
// PRINT-NEXT:    init(with withIAMStruct1: IAMStruct1)
// PRINT-NEXT:    init(withURL url: UnsafePointer<Int8>)
// PRINT-NEXT:    func doSomething()
// PRINT-NEXT:  }
//
// PRINT-LABEL: struct TDStruct {
// PRINT-NEXT:    var x: Double
// PRINT-NEXT:    init()
// PRINT-NEXT:    init(x x: Double)
// PRINT-NEXT:  }
// PRINT-NEXT:  extension TDStruct {
// PRINT-NEXT:    init(with Float: Float)
// PRINT-NEXT:  }
//
// PRINT-LABEL: /// Class
// PRINT-NEXT:  class IAMClass {
// PRINT-NEXT:  }
//
// PRINT-LABEL: /// Class
// PRINT-NEXT:  @available(*, unavailable, renamed: "IAMClass", message: "Not available in Swift")
// PRINT-NEXT:  typealias IAMClassRef = IAMClass
// PRINT-NEXT:  typealias IAMOtherName = IAMClass
// PRINT-NEXT:  extension IAMClass {
// PRINT-NEXT:    class var typeID: UInt32 { get }
// PRINT-NEXT:    init!(i i: Double)
// PRINT-NEXT:    class func invert(_ iamOtherName: IAMOtherName!)
// PRINT-NEXT:  }
