//
//  CourseViewController.swift
//  CodeForum
//
//  Created by QHuiYan on 2023/5/22.
//

import UIKit

var index1: Array<Dictionary<String, String>> = []

class previewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .clear
    }
}

class LearningViewController: UIViewController, UIContextMenuInteractionDelegate {

    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        
        var identifier = Int()
        if let button = interaction.view as? UIButton {
            identifier = button.tag
        }
        
        return UIContextMenuConfiguration(identifier: nil, previewProvider: {
            
            let previewControllerInstance = previewController()
            if identifier < 7 {
                let image = UIImageView(frame: CGRect(x: spacedForScreen, y: spacedForScreen, width: previewControllerInstance.view.bounds.width - spacedForScreen * 2, height: previewControllerInstance.view.bounds.width - spacedForScreen * 2))
                image.layer.cornerRadius = basicCornerRadius(image.frame.size) * 0.5
                image.clipsToBounds = true
                image.image = UIImage(named: index1[identifier]["name"]!)
                previewControllerInstance.view.addSubview(image)
                
                // 设置精选课程的标题
                let courseLabel = UILabel(frame: CGRect(x: spacedForScreen, y: image.frame.maxY + spacedForScreen, width: 0, height: 0))
                courseLabel.text = index1[identifier]["name"]
                courseLabel.font = UIFont.systemFont(ofSize: titleFont2, weight: .bold)
                courseLabel.sizeToFit()
                courseLabel.isUserInteractionEnabled = false
                previewControllerInstance.view.addSubview(courseLabel)
                
                // 设置精选课程的作者名
                let courseLabel2 = UILabel(frame: CGRect(x: spacedForScreen, y: courseLabel.frame.maxY + spacedForControl, width: 0, height: 0))
                courseLabel2.text = index1[identifier]["author"]
                courseLabel2.font = UIFont.systemFont(ofSize: CGFloat(titleFont3), weight: .regular)
                courseLabel2.sizeToFit()
                courseLabel2.isUserInteractionEnabled = false
                previewControllerInstance.view.addSubview(courseLabel2)
                
                previewControllerInstance.preferredContentSize = CGSize(width: previewControllerInstance.view.bounds.width, height: courseLabel2.frame.maxY + spacedForScreen)
            } else {
                let image = UIImageView(frame: CGRect(x: spacedForScreen, y: spacedForScreen, width: previewControllerInstance.view.bounds.width - spacedForScreen * 2, height: previewControllerInstance.view.bounds.width - spacedForScreen * 2))
                image.layer.cornerRadius = basicCornerRadius(image.frame.size) * 0.5
                image.clipsToBounds = true
                image.image = UIImage(named: index1[identifier - 7]["name"]!)
                previewControllerInstance.view.addSubview(image)
                
                // 设置精选课程的标题
                let courseLabel = UILabel(frame: CGRect(x: spacedForScreen, y: image.frame.maxY + spacedForScreen, width: 0, height: 0))
                courseLabel.text = index1[identifier - 7]["name"]
                courseLabel.font = UIFont.systemFont(ofSize: titleFont2, weight: .bold)
                courseLabel.sizeToFit()
                courseLabel.isUserInteractionEnabled = false
                previewControllerInstance.view.addSubview(courseLabel)
                
                // 设置精选课程的作者名
                let courseLabel2 = UILabel(frame: CGRect(x: spacedForScreen, y: courseLabel.frame.maxY + spacedForControl, width: 0, height: 0))
                courseLabel2.text = index1[identifier - 7]["author"]
                courseLabel2.font = UIFont.systemFont(ofSize: CGFloat(titleFont3), weight: .regular)
                courseLabel2.sizeToFit()
                courseLabel2.isUserInteractionEnabled = false
                previewControllerInstance.view.addSubview(courseLabel2)
                
                previewControllerInstance.preferredContentSize = CGSize(width: previewControllerInstance.view.bounds.width, height: courseLabel2.frame.maxY + spacedForScreen)
            }
            
            return previewControllerInstance
        }) { suggestedActions in
            let action1 = UIAction(title: "查看该课程", image: UIImage(systemName: "eye")) { action in
            }
            let action2 = UIAction(title: "收藏至收藏夹", image: UIImage(systemName: "star")) { action in
            }
            let action3 = UIAction(title: "分享给朋友", image: UIImage(systemName: "square.and.arrow.up")) { action in
            }
            let menu1 = UIMenu(title: "",options: .displayInline, children: [action1, action2, action3])
            let action4 = UIAction(title: "点赞课程", image: UIImage(systemName: "hand.thumbsup")) { action in
            }
            let action5 = UIAction(title: "打赏作者", image: UIImage(systemName: "dollarsign.circle")) { action in
            }
            let action6 = UIAction(title: "减少推荐", image: UIImage(systemName: "hand.thumbsdown")) { action in
            }
            let menu2 = UIMenu(title: "",options: .displayInline, children: [action4, action5, action6])
            let action7 = UIAction(title: "反馈问题", image: UIImage(systemName: "quote.bubble.rtl")) { action in
            }
            let action8 = UIAction(title: "举报不良信息", image: UIImage(systemName: "exclamationmark.bubble"), attributes: .destructive) { action in
            }
            let menu3 = UIMenu(title: "",options: .displayInline, children: [action7, action8])
            return UIMenu(title: "", children: [menu1, menu2, menu3])
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set the backgroundColor of the interface and the title of the navigationBar
        view.backgroundColor = .systemBackground
        navigationItem.title = "开始学习"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // Set the UIScrollView at the underlying of the interface
        let mainScrollView = UIScrollView(frame: screenFrame)
        mainScrollView.contentSize = CGSize(width: screenWidth, height: screenHeight * 2)
        view.addSubview(mainScrollView)
        
        // Set the UILabel at the featuredCoursesBox tilte
        let featuredCourseLable = UILabel(frame: CGRect(x: spacedForScreen, y: spacedForModule, width: 0, height: 0))
        featuredCourseLable.text = "精选课程"
        featuredCourseLable.font = UIFont.systemFont(ofSize: titleFont2, weight: .bold)
        featuredCourseLable.sizeToFit()
        mainScrollView.addSubview(featuredCourseLable)
        
        // Set a UIScrollView of featuredCourses at the top of the interface
        let headerScrollView = UIScrollView(frame: CGRect(x: 0, y: featuredCourseLable.frame.maxY + spacedForModule3, width: screenWidth, height: largeControl.height))
        headerScrollView.contentSize = CGSize(width: largeControl.width * 7 + spacedForControl * 6 + spacedForScreen * 2, height: largeControl.height)
        headerScrollView.showsHorizontalScrollIndicator = false
        headerScrollView.clipsToBounds = false
        mainScrollView.addSubview(headerScrollView)
        
        // Set the UILabel at the featuredCoursesBox tilte
        let featuredCourseLable1 = UILabel(frame: CGRect(x: spacedForScreen, y: spacedForModule + headerScrollView.frame.height + spacedForModule2 * 2, width: 0, height: 0))
        featuredCourseLable1.text = "精选文章"
        featuredCourseLable1.font = UIFont.systemFont(ofSize: titleFont2, weight: .bold)
        featuredCourseLable1.sizeToFit()
        mainScrollView.addSubview(featuredCourseLable1)
        
        // 设置随机数来从课程数据库中取用数据
        var newCourseData = courseData() // 获取CourseData中的数据
        newCourseData.shuffle() // 打乱数组顺序
        for i in 0 ... 6 {
            index1.append(newCourseData.prefix(7)[i]) // 取出前7个元素
        }
        
        // 循环创建精选课程框
        for i in 0 ... 6 {
            
            // 创建精选课程框
            let featuredCourseBox = UIButton(frame: CGRect(x: spacedForScreen + CGFloat(CGFloat(i) * (largeControl.width + spacedForControl)), y: 0, width: largeControl.width, height: largeControl.height))
            featuredCourseBox.layer.cornerRadius = basicCornerRadius(featuredCourseBox.frame.size)
            featuredCourseBox.setImage(UIImage(named: index1[i]["name"]!), for: .normal)
            featuredCourseBox.imageView?.contentMode = .scaleAspectFill
            featuredCourseBox.layer.masksToBounds = true
            featuredCourseBox.tag = i
            featuredCourseBox.addTarget(self, action: #selector(click), for: .touchUpInside)
            headerScrollView.addSubview(featuredCourseBox)
            
            // 设置精选课程框底部的高斯模糊
            let blurEffect = UIBlurEffect(style: .light)
            let blurView = UIVisualEffectView(effect: blurEffect)
            blurView.frame = CGRect(x: 0, y: featuredCourseBox.frame.height / 4 * 3, width: featuredCourseBox.frame.width, height: featuredCourseBox.frame.height / 4)
            blurView.isUserInteractionEnabled = false
            featuredCourseBox.addSubview(blurView)
            
            // 设置精选课程的标题
            let courseLabel = UILabel(frame: CGRect(x: spacedForControl, y: featuredCourseBox.frame.height / 4 * 3 + spacedForScreen, width: 0, height: 0))
            courseLabel.text = index1[i]["name"]
            courseLabel.font = UIFont.systemFont(ofSize: CGFloat(titleFont3), weight: .bold)
            courseLabel.sizeToFit()
            courseLabel.isUserInteractionEnabled = false
            featuredCourseBox.addSubview(courseLabel)
            
            // 设置精选课程的作者名
            let courseLabel2 = UILabel(frame: CGRect(x: spacedForControl, y: featuredCourseBox.frame.height / 4 * 3 + spacedForScreen + courseLabel.frame.height, width: 0, height: 0))
            courseLabel2.text = index1[i]["author"]
            courseLabel2.font = UIFont.systemFont(ofSize: basicFont, weight: .regular)
            courseLabel2.sizeToFit()
            courseLabel2.isUserInteractionEnabled = false
            featuredCourseBox.addSubview(courseLabel2)
            
            let interaction = UIContextMenuInteraction(delegate: self)
            featuredCourseBox.addInteraction(interaction)
            
        }
        
        var cellViewArray: Array<UIButton> = []
        for i in 0 ... 6 {
            // 创建精选文章的框
            let cellView = UIButton(frame: CGRect(origin: CGPoint(x: spacedForScreen, y: featuredCourseLable1.frame.maxY + spacedForModule3 + CGFloat(i) * (spacedForModule3 + mediumControl.height)), size: mediumControl))
            cellView.setImage(UIImage(named: index1[i]["name"]!), for: .normal)
            cellView.imageView?.contentMode = .scaleAspectFill
            cellView.layer.cornerRadius = basicCornerRadius(cellView.frame.size)
            cellView.clipsToBounds = true
            cellView.tag = i + 7
            cellView.addTarget(self, action: #selector(click), for: .touchUpInside)
            cellViewArray.append(cellView)
            mainScrollView.addSubview(cellView)
            
            // 设置精选文章信息区域的高斯模糊背景
            let blurEffect = UIBlurEffect(style: .light)
            let blurView = UIVisualEffectView(effect: blurEffect)
            if i == 2 || i == 3 || i == 4 {
                blurView.frame = CGRect(x: cellView.frame.width / 5 * 2, y: 0, width: cellView.frame.width - cellView.frame.width / 5 * 2, height: cellView.frame.height + 1)
            } else {
                blurView.frame = CGRect(x: 0, y: 0, width: cellView.frame.width - cellView.frame.width / 5 * 2, height: cellView.frame.height + 1)
            } // 判断模糊应该在左边还是右边
            blurView.isUserInteractionEnabled = false
            cellView.addSubview(blurView)
            
            // 创建封面图视图
            let imageView = UIImageView(image: UIImage(named: index1[i]["name"]!))
            imageView.frame = CGRect(x: blurView.frame.origin.x == 0 ? blurView.frame.origin.x + blurView.frame.width - 1: 0, y: 0, width: cellView.frame.width - blurView.frame.width + 1, height: cellView.frame.height)
            imageView.isUserInteractionEnabled = false
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            cellView.addSubview(imageView)
            
            // 设置精选文章的标题
            let essayLabel = UILabel(frame: CGRect(x: blurView.frame.origin.x + spacedForControl, y: 0, width: blurView.frame.width - spacedForControl * 2, height: 0))
            essayLabel.text = index1[i]["name"]
            essayLabel.font = UIFont.systemFont(ofSize: CGFloat(titleFont3), weight: .bold)
            // 根据字符串长度赋予不同行数,最多为两行
            if isTruncated(essayLabel) {
                essayLabel.numberOfLines += 1
            }
            essayLabel.sizeToFit()
            essayLabel.frame.size.width = blurView.frame.width - spacedForControl * 2
            essayLabel.isUserInteractionEnabled = false
            cellView.addSubview(essayLabel)
            
            // 设置精选文章的作者名
            let essayLabel2 = UILabel()
            essayLabel2.text = index1[i]["author"]
            essayLabel2.font = UIFont.systemFont(ofSize: basicFont, weight: .regular)
            essayLabel2.sizeToFit()
            essayLabel2.isUserInteractionEnabled = false
            cellView.addSubview(essayLabel2)
            
            // 根据字符串行数判断动态坐标
            if essayLabel.numberOfLines == 1 {
                essayLabel.frame.origin.y = (blurView.frame.height - essayLabel.frame.height * 2 - essayLabel2.frame.height - spacedForControl) / 2
                essayLabel2.frame.origin = CGPoint(x: blurView.frame.origin.x + spacedForControl, y: (blurView.frame.height - essayLabel.frame.height * 2 - essayLabel2.frame.height - spacedForControl) / 2 + essayLabel.frame.height * 2 + spacedForControl)
            } else {
                essayLabel.frame.origin.y = (blurView.frame.height - essayLabel.frame.height - essayLabel2.frame.height - spacedForControl) / 2
                essayLabel2.frame.origin = CGPoint(x: blurView.frame.origin.x + spacedForControl, y: (blurView.frame.height - essayLabel.frame.height - essayLabel2.frame.height - spacedForControl) / 2 + essayLabel.frame.height + spacedForControl)
            }
            
            let interaction = UIContextMenuInteraction(delegate: self)
            cellView.addInteraction(interaction)
        }
        
        mainScrollView.contentSize = CGSize(width: screenWidth, height: cellViewArray[6].frame.maxY + spacedForModule3)
        
        
    }
    
    @objc func click(_ sender: UIButton) {
        let b = CourseViewController()
        let a = PaperViewController()
        if sender.tag < 7 {
            self.navigationController?.pushViewController(b, animated: true)
        } else {
            self.navigationController?.pushViewController(a, animated: true)
        }
    }
    
}

