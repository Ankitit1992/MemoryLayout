import UIKit


// Memory Layout for Value type and reference type

// Three things at allocation of Memory for value type
/**
 
 size : -  Size is the number of bytes required to actually store that type.
 
 stride: - Stride will tell you about the distance between two elements on the buffer
 
 Alignment: - alignment will tell you how much memory is needed (multiple of the alignment value) to save things perfectly aligned on a memory buffer.

 Notes: -  memory buffer should always multiply of 8 should feel with padding to complet the 8 byte multiplcation
 
 // For reference type: -
 
 Memory layout work differently
 1- They size of empty class instance  is 16
 2- Property will get space as per there size
 3- the complete size of class will always be 8 byte in memoy layout
 
 --------------------------------------------------------------------------------
 
 Please find all below edge cases
 */

struct Demo {
    var v3: Bool // 1 + 7 padding for completing alignment
    var v1: Int // 8
    var v2: Double // 8 total = 24 stride = 24
}

print(MemoryLayout<Demo>.size)

struct Demo01 {
    var v1: Int // 8
    var v3: Bool // 1 + 7 padding
    var v2: Double // 8  total size = 24 stride = 24
}
print(MemoryLayout<Demo01>.size)

struct Demo02 {
    var v1: Int // 8
    var v2: Double // 8
    var v3: Bool // 1 + 7 pading totale size = 17 stride = 24
}
print(MemoryLayout<Demo02>.size)
print(MemoryLayout<Demo02>.stride)

struct Demo03 {
    var v4: Bool // 1 + 7 padding
    var string: String // 16
    var v1: Int // 8
    var v3: Double // 8 total = 40
}
print(MemoryLayout<String>.size)
print(MemoryLayout<Demo03>.size)

struct Demo04 {
    var v4: Bool //1
    var v5: Bool//1
    var v7: Bool//1
    var v8: Bool//1
    var v40: Bool//1
    var v50: Bool//1
    var v70: Bool//1
    var v80: Bool//1 total = 8 complete 8 buffer
    var v90: Bool// 1 + 7 padding = 8 added 7 to complete 8
    var v10: Int// 8
    var v100: Bool // 1 + 7 = 8
    var v3: Double
    var v110: Bool // 1 + 7  total size = 41 stride = 48
}
print(MemoryLayout<String>.size)
print(MemoryLayout<Demo04>.size)
print(MemoryLayout<Demo04>.stride)


struct Demo05 {
    var v1: Int
    var v2: Bool
    var v3: Bool
}

print(MemoryLayout<Demo05>.size)
print(MemoryLayout<Demo05>.stride)

struct Demo06 {
    var v1: Bool
    var v2: Int
    var v3: Bool
}

print(MemoryLayout<Demo06>.size)
print(MemoryLayout<Demo06>.stride)

struct Layout {
    var v1: Bool
    var v2: Int
    var v3: Double
    var v5: Bool
    var demo: Demo
}

var layout = Layout(v1: true, v2: 0, v3: 0.0, v5: false, demo: Demo(v3: false, v1: 0, v2: 0.0))
print("---------------------------")
print(MemoryLayout.size(ofValue: layout.v1))
print(MemoryLayout.size(ofValue: layout.v2))
print(MemoryLayout.size(ofValue: layout.v3))
print(MemoryLayout.size(ofValue: layout))
print(MemoryLayout<Layout>.size)
print(MemoryLayout<Layout>.stride)
print(MemoryLayout<Layout>.alignment)


class Layout01 {
    var v1: Bool // 1 + 7 padding
    var v2: Int // 8 total 16
    init(v1: Bool, v2: Int) {
        self.v1 = v1
        self.v2 = v2
    }
}

var layout01 = Layout01(v1: true, v2: 0)

print(MemoryLayout.size(ofValue: layout01.v1)) //1
print(MemoryLayout.size(ofValue: layout01.v2)) //8
print(MemoryLayout.size(ofValue: layout01)) //8

print(class_getInstanceSize(Layout01.self)) // 16 + 16 16byte us default  space for class instance


class Demo10 {}
print(class_getInstanceSize(Demo10.self))
