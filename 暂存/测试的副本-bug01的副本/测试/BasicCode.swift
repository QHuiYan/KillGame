import Foundation
import UIKit

// 获取安全插值
let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
let window = windowScene?.windows.first
let safeAreaInsets = window?.safeAreaInsets ?? UIEdgeInsets.zero
// 基础属性
let screenFrame = UIScreen.main.bounds // 屏幕原点和尺寸
let screenWidth: CGFloat = UIScreen.main.bounds.width // 屏幕宽度
let screenHeight: CGFloat = UIScreen.main.bounds.height // 屏幕高度
let screenSpaced = screenWidth / 20 // 屏幕边距
let controlSpaced = screenSpaced / 2 // 控件间距
let moduleSpaced = screenSpaced * 1.5 // 模块间距
let navHeight = screenHeight / 20 // 导航栏辅助高度
let moduleOrigin = CGPoint(x: screenSpaced, y: moduleSpaced) // 模块原点
let controlOrigin = CGPoint(x: screenSpaced, y: controlSpaced) // 控件原点
let basicWidth = CGFloat(screenWidth - screenSpaced * 2) // 标准宽度，屏幕宽度减去两个屏幕边距screenSpaced
let basicCornerRadius = CGFloat(15) // 标准控件圆角

// 具体控件的框架或原点或尺寸
let navLabelFrame = CGRect(x: screenSpaced, y: 0, width: basicWidth, height: screenHeight / 25) // 导航栏标题框架
let tableCellFrame = CGRect(origin: controlOrigin, size: CGSize(width: basicWidth, height: (screenHeight - navHeight * 2 - safeAreaInsets.top - safeAreaInsets.bottom) / 6)) // tableView的cell的内部显示视图的尺寸

// 字体大小
let basicFont = screenHeight / 50 // 标准正文字体大小
let titleFont = screenHeight / 25 // 一级标题字体大小
let titleFont2 = screenHeight / 35 // 二级标题字体大小
let titleFont3 = screenHeight / 45 // 三级标题字体大小

func navBar(_ navBar: UINavigationBar) -> CGFloat {
    navBar.frame.height
}

// CourseData数据初始化
func courseData() -> Array<Dictionary<String, String>>  {

    var courseDataArray: Array<Dictionary<String, String>> = []
    if let path = Bundle.main.path(forResource: "CourseData", ofType: "plist") {
        if let array = NSArray(contentsOfFile: path) as? [Dictionary<String, String>] {
            courseDataArray = array
        }
    }
    return courseDataArray
    
}

// EssayData数据初始化
func essayData() -> Array<Dictionary<String, String>>  {
    
    var essayDataArray: Array<Dictionary<String, String>> = []
    if let path = Bundle.main.path(forResource: "EssayData", ofType: "plist") {
        if let array = NSArray(contentsOfFile: path) as? [Dictionary<String, String>] {
            essayDataArray = array
        }
    }
    return essayDataArray
    
}
