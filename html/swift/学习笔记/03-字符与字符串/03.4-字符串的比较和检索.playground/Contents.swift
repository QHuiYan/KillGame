import UIKit

let str = (compare_0: "这是一数字", compare_1: "这是一段文字", count_0: "1234567890_qwertyuiop_asdfghjkl_zxcvbnm", nil: "", index_0: "AAA_BBBB_CCCCC", index_1: "A_1 🥰")
var num = 0

print("——————— 1.字符串的比较与计数 ———————")

str.compare_0 == str.compare_1
print(str.count_0, "有", str.count_0.count, "个字符")
str.count_0.count == 0
str.count_0.isEmpty

/* 判断字符串是否相等，和判断数据是否相等一样，使用比较运算符 (比较两个字符串的大小似乎和子集相关知识有关)
 .count 会对字符进行计数，可以通过这一点结合比较运算符判断一个字符串是否为空字符串；不过使用 isEmpty 判断字符串是否为空性能更佳 (一般建议使用 isEmpty) */

for _ in str.index_0 {
    num += 1
    print("检索到第", num, "个字符")
}
print("一共有", num, "个字符")

// 可以通过 for in 循环遍历字符串中的每一个字符，达到计数和检索的功能

print("——————— 2.字符串的内容检索 ———————")

str.index_0.contains("AAA")
str.index_0.starts(with: "AAA")
str.index_0.hasPrefix("BBB")
str.index_0.hasSuffix("CCC")
print(str.index_0)

/* .contains("") 检测字符串内是否有某一个字符或字符串 (引号内为想要检索的内容)，然后返回一个 bool 值
 .starts(with: "") 和 .hasPrefix("") 检测字符串起始处是否为某一个字符或字符串 (引号内为想要检索的内容)，然后返回一个 bool 值
 .hasSuffix("") 检测字符串结尾处是否为某一个字符或字符串 (引号内为想要检索的内容)，然后返回一个 bool 值 */

print("——————— 3.字符串内的字符类型检索 ———————")

for i in str.index_1 {
    print("————————",i , "————————")
    print(i, "是否为符号", i.isSymbol)
    print(i, "是否为数字", i.isNumber)
    print(i, "是否为字母", i.isLetter)
    print(i, "是否为空格", i.isWhitespace)
}
// isSymbol、isNumber、isLetter、isWhitespace 分别可以判断一个字符是否为符号、数字、字母、空格，然后返回一个 bool 值
