//
//  ViewController.swift
//  ScrollViewApp
//
//  Created by Vasichko Anna on 25.04.2022.
//

import UIKit

class MainViewController: UIViewController {
    
    
    lazy var contentSize = CGSize(width: view.frame.width, height: view.frame.height + 400)
    
    lazy var scrollView: UIScrollView = {
      let scrollView = UIScrollView()
      scrollView.backgroundColor = .white
      scrollView.frame = self.view.bounds
      scrollView.contentSize = contentSize
      return scrollView
    }()

    lazy var contentView: UIView = {
      let contentView = UIView()
      contentView.backgroundColor = .white
      contentView.frame.size = contentSize
      return contentView
    }()

    let stackView: UIStackView = {
      let stackView = UIStackView()
      stackView.axis = .vertical
      stackView.alignment = .center
      stackView.spacing = 20
      return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        
        setupViewsConstraints()
    }
}


//MARK: - Setup Views
extension MainViewController {
    private func setupViewsConstraints() {
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(stackView)
        
        for _ in 0..<10 {
            let view = UIView()
            view.backgroundColor = .systemRed
            stackView.addArrangedSubview(view)
          }
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
            stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor)
          ])

          for view in stackView.arrangedSubviews {
            NSLayoutConstraint.activate([
              view.widthAnchor.constraint(equalToConstant: 300),
              view.heightAnchor.constraint(equalToConstant: 100),
            ])
          }
    }
}
