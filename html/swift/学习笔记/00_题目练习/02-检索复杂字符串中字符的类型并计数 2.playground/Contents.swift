import UIKit

var (str0, num0, num1, num2, num3, num4, num5) = ("abyuhg😇 123😃5 n😅", 0, 0, 0, 0, 0, 0)
// 声明多个为0的变量，为了方便后续计数使用

for i in str0 {
    num0 += 1
    if i.isSymbol {
        num1 += 1
    }
    else if i.isNumber {
        num2 += 1
    }
    else if i.isLetter {
        num3 += 1
    }
    else if i.isWhitespace {
        num4 += 1
    }
    else {
        num5 += 1
    }
}
// isSymbol、isNumber、isLetter、isWhitespace 分别可以判断一个字符是否为符号、数字、字母、空格，然后返回一个bool值
// 使用 for in 循环语句，依次对字符串str0中的字符进行检测，每次进入循环后，都会进入循环内的一个分支：如 str0 中第一个字符 a ，进入循环后会其是字母，在 isLetter 执行后会返回一个 true，随即进入该if内，执行 num3 += 1，如此反复，每一个字符都会使得 num1、2、3、4、5 其中的一个 +1，且皆会让 num0+1
print("检测到字符串｜", str0, "｜中共有", num0, "个字符。")
print("其中有", num1, "个为符号。")
print("其中有", num2, "个为数字。")
print("其中有", num3, "个为字母。")
print("其中有", num4, "个为空格。")
if num5 == 0 {
    print("没有其他种类的字符。")
}
else {
    print("其他类别的字符有", num5, "个。")
}

// 因为 for in 语句内的数字会因为字符的类型同步增加，所以相应的数字即会表示其所对应字符类型的字符数量
