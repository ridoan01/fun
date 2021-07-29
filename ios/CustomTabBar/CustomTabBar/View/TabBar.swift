//
//  TabBar.swift
//  CustomTabBar
//
//  Created by Ridoan Wibisono on 26/07/21.
//

import UIKit

class TabBar: UITabBar {
	
	
	private var shapeLayer : CALayer?
	
	private func addShape(){
		let shapeLayer = CAShapeLayer()
		shapeLayer.path = createRecTabBar()
		shapeLayer.strokeColor = UIColor.clear.cgColor
		shapeLayer.fillColor = UIColor.tertiaryLabel.cgColor
		shapeLayer.lineWidth = 1.0
		
		shapeLayer.shadowOffset = CGSize(width: 0, height: 0)
		shapeLayer.shadowRadius = 10
		shapeLayer.shadowColor = UIColor.systemTeal.cgColor
		shapeLayer.shadowOpacity = 0.3
		
		
		
		if let oldShapeLayer = self.shapeLayer{
			self.layer.replaceSublayer(oldShapeLayer, with: shapeLayer)
		}
		else{
			self.layer.insertSublayer(shapeLayer, at: 0)
		}
		
		if let items = self.items {
			items.forEach { item in
				item.imageInsets = UIEdgeInsets(top: 0, left: 0, bottom: -15, right: 0)
			}
		}
		
		self.itemWidth = 38.0
		self.itemPositioning = .centered
		self.shapeLayer = shapeLayer
	}
	
	override func draw(_ rect: CGRect) {
		addShape()
		self.unselectedItemTintColor = UIColor.systemGroupedBackground
		self.tintColor = UIColor.systemTeal
	}
	
	//	func createPath() -> CGPath{
	//		let height: CGFloat = 30
	//		let path = UIBezierPath(roundedRect: CGRect(x: (self.bounds.width - 60) / 10, y: self.bounds.height - 85, width: self.bounds.width - 60, height: 48), cornerRadius: (self.frame.width / 2))
	//		let centerWidth = self.frame.width / 2
	//
	//
	//		path.move(to: CGPoint(x: 0, y: 0)
	//		path.addQuadCurve(to: CGPoint(x: self.frame.width, y: 0), controlPoint: CGPoint(x: centerWidth, y: height))
	//		path.addLine(to: CGPoint(x: self.frame.width, y: self.frame.height))
	//		path.addLine(to: CGPoint(x: 0, y: self.frame.height))
	//		path.close()
	//
	//		return path.cgPath
	//	}
	
	override open func sizeThatFits(_ size: CGSize) -> CGSize {
		super.sizeThatFits(size)
		var sizeThatFits = super.sizeThatFits(size)
		sizeThatFits.height = 70
		return sizeThatFits
	}
	
	func createRecTabBar() -> CGPath{
		let path = UIBezierPath(roundedRect: CGRect(x: (self.bounds.width - 60) / 10,
													y: self.bounds.height - 85,
													width: self.bounds.width - 60,
													height: 48),
								cornerRadius: (self.frame.width / 2))
		
		return path.cgPath
	}
	
	
}
