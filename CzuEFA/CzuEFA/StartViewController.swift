//
//  StartViewController.swift
//  CzuEFA
//
//  Created by Дмитрий Головин on 30.04.2021.
//

import UIKit

class StartViewController: UIViewController {

    var logoImage: UIImageView!
    var startButton: UIButton!
    var authorLabel: UILabel!
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        logoImage = UIImageView()
        logoImage.image = UIImage(named: "placeholderImage")
        logoImage.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(logoImage)
        
        startButton = UIButton()
        startButton.setTitle("Start game", for: .normal)
        startButton.translatesAutoresizingMaskIntoConstraints = false
        startButton.backgroundColor = .black
        startButton.tintColor = .white
        startButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        startButton.layer.cornerRadius = 22
        startButton.addTarget(self, action: #selector(startGame), for: .touchUpInside)
        view.addSubview(startButton)
        
        authorLabel = UILabel()
        authorLabel.text = "Сделано митей"
        authorLabel.textAlignment = .left
        authorLabel.font = UIFont.systemFont(ofSize: 15)
        authorLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(authorLabel)
        
        NSLayoutConstraint.activate([
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.7),
            logoImage.heightAnchor.constraint(equalToConstant: 300),
            
            startButton.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 40),
            startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            startButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
            startButton.heightAnchor.constraint(equalToConstant: 50),
            
            authorLabel.bottomAnchor.constraint(equalTo: view.layoutMarginsGuide.bottomAnchor, constant: 10),
            authorLabel.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor, constant: 20)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Welcome!"
        
        
    }
    
    @objc private func startGame() {
        let vc = storyboard?.instantiateViewController(identifier: "GameVC") as? ViewController
        navigationController?.pushViewController(vc!, animated: true)
    }
}
