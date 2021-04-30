//
//  ViewController.swift
//  CzuEFA
//
//  Created by Дмитрий Головин on 28.04.2021.
//

import UIKit

class ViewController: UIViewController {

    var items = ["scissors", "stone", "paper"]
    
    var playerLives = 3 {
        didSet {
            switch playerLives {
            case 3:
                
                playerHealth3.isHidden = false
                playerHealth2.isHidden = false
                playerHealth1.isHidden = false
            case 2:
                playerHealth3.isHidden = true
            case 1:
                playerHealth2.isHidden = true
            case 0:
                playerHealth1.isHidden = true
                
                loose()
            default:
                break
            }
        }
    }
    var enemyLives = 3 {
        didSet {
            switch enemyLives {
            case 3:
                enemyHealth3.isHidden = false
                enemyHealth2.isHidden = false
                enemyHealth1.isHidden = false
            case 2:
                enemyHealth3.isHidden = true
            case 1:
                enemyHealth2.isHidden = true
            case 0:
                enemyHealth1.isHidden = true
                
                win()
            default:
                break
            }
        }
    }
    
    var playerLabel: UILabel!
    var playerHealth1: UIImageView!
    var playerHealth2: UIImageView!
    var playerHealth3: UIImageView!
    
    var enemyLabel: UILabel!
    var enemyHealth1: UIImageView!
    var enemyHealth2: UIImageView!
    var enemyHealth3: UIImageView!
    
    
    var enemy: UIImageView!
    var player: UIImageView!
    
    var enemyItem: UILabel!
    var playerItem: UILabel!
    
    var playButton: UIButton!
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .white
        
        playerLabel = UILabel()
        playerLabel.text = "Your lives:"
        playerLabel.font = UIFont.systemFont(ofSize: 12)
        playerLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(playerLabel)
        
        enemyLabel = UILabel()
        enemyLabel.text = "Enemie's lives:"
        enemyLabel.font = UIFont.systemFont(ofSize: 12)
        enemyLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(enemyLabel)
        
        playerHealth1 = UIImageView()
        playerHealth1.translatesAutoresizingMaskIntoConstraints = false
        playerHealth1.image = UIImage(systemName: "heart.fill")
        playerHealth1.tintColor = .red
        view.addSubview(playerHealth1)
        
        playerHealth2 = UIImageView()
        playerHealth2.translatesAutoresizingMaskIntoConstraints = false
        playerHealth2.image = UIImage(systemName: "heart.fill")
        playerHealth2.tintColor = .red
        view.addSubview(playerHealth2)
        
        playerHealth3 = UIImageView()
        playerHealth3.translatesAutoresizingMaskIntoConstraints = false
        playerHealth3.image = UIImage(systemName: "heart.fill")
        playerHealth3.tintColor = .red
        view.addSubview(playerHealth3)
        
        enemyHealth1 = UIImageView()
        enemyHealth1.translatesAutoresizingMaskIntoConstraints = false
        enemyHealth1.image = UIImage(systemName: "heart.fill")
        enemyHealth1.tintColor = .black
        view.addSubview(enemyHealth1)
        
        enemyHealth2 = UIImageView()
        enemyHealth2.translatesAutoresizingMaskIntoConstraints = false
        enemyHealth2.image = UIImage(systemName: "heart.fill")
        enemyHealth2.tintColor = .black
        view.addSubview(enemyHealth2)
        
        enemyHealth3 = UIImageView()
        enemyHealth3.translatesAutoresizingMaskIntoConstraints = false
        enemyHealth3.image = UIImage(systemName: "heart.fill")
        enemyHealth3.tintColor = .black
        view.addSubview(enemyHealth3)
        
        enemy = UIImageView()
        enemy.translatesAutoresizingMaskIntoConstraints = false
        enemy.image = UIImage(named: "main")
        view.addSubview(enemy)
        
        player = UIImageView()
        player.translatesAutoresizingMaskIntoConstraints = false
        player.image = UIImage(named: "main")
        view.addSubview(player)
        
        enemyItem = UILabel()
        enemyItem.translatesAutoresizingMaskIntoConstraints = false
        enemyItem.text = "Enemy"
        enemyItem.font = UIFont.systemFont(ofSize: 25)
        enemyItem.textAlignment = .center
        view.addSubview(enemyItem)
        
        playerItem = UILabel()
        playerItem.translatesAutoresizingMaskIntoConstraints = false
        playerItem.text = "You"
        playerItem.font = UIFont.systemFont(ofSize: 25)
        playerItem.textAlignment = .center
        view.addSubview(playerItem)
        
        playButton = UIButton()
        playButton?.setTitle("Play", for: .normal)
        playButton?.backgroundColor = .black
        playButton?.tintColor = .white
        playButton.addTarget(self, action: #selector(playButtonTapped), for: .touchUpInside)
        playButton.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        playButton.layer.cornerRadius = 20
        playButton?.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(playButton)
        
        NSLayoutConstraint.activate([
            enemy.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 70),
            enemy.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            enemy.heightAnchor.constraint(equalToConstant: 135),
            enemy.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            enemyItem.topAnchor.constraint(equalTo: enemy.bottomAnchor, constant: 20),
            enemyItem.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            player.topAnchor.constraint(equalTo: enemyItem.bottomAnchor, constant: 100),
            player.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            player.heightAnchor.constraint(equalToConstant: 135),
            player.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            playerItem.topAnchor.constraint(equalTo: player.bottomAnchor, constant: 20),
            playerItem.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            playButton.topAnchor.constraint(equalTo: playerItem.bottomAnchor, constant: 80),
            playButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.4),
            playButton.heightAnchor.constraint(equalToConstant: 44),
            playButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            playerLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            playerLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            
            enemyLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            enemyLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            
            playerHealth1.topAnchor.constraint(equalTo: playerLabel.bottomAnchor, constant: 4),
            playerHealth1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 5),
            
            playerHealth2.topAnchor.constraint(equalTo: playerLabel.bottomAnchor, constant: 4),
            playerHealth2.leadingAnchor.constraint(equalTo: playerHealth1.trailingAnchor, constant: 3),
            
            playerHealth3.topAnchor.constraint(equalTo: playerLabel.bottomAnchor, constant: 4),
            playerHealth3.leadingAnchor.constraint(equalTo: playerHealth2.trailingAnchor, constant: 3),
            
            enemyHealth3.topAnchor.constraint(equalTo: enemyLabel.bottomAnchor, constant: 4),
            enemyHealth3.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -5),
            
            enemyHealth2.topAnchor.constraint(equalTo: enemyLabel.bottomAnchor, constant: 4),
            enemyHealth2.trailingAnchor.constraint(equalTo: enemyHealth3.leadingAnchor, constant: -3),
            
            enemyHealth1.topAnchor.constraint(equalTo: enemyLabel.bottomAnchor, constant: 4),
            enemyHealth1.trailingAnchor.constraint(equalTo: enemyHealth2.leadingAnchor, constant: -3)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Камень-Ножницы-Бумага"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(reloadLevel))
        
    }

    @objc private func playButtonTapped(_ sender: UIButton) {
        
        guard let playerTool = items.shuffled().randomElement() else  { return }
        guard let enemyTool = items.shuffled().randomElement() else { return }
        
        print(enemyTool)
        
        enemy.image = UIImage(named: enemyTool)
        enemyItem.text = enemyTool
        
        player.image = UIImage(named: playerTool)
        playerItem.text = playerTool
        
        checkResult(enemyTool: enemyTool, playerTool: playerTool)
        
    }

    @objc private func reloadLevel() {
        player.image = UIImage(named: "main")
        enemy.image = UIImage(named: "main")
        playerItem.text = "You"
        enemyItem.text = "Enemy"
        playerLives = 3
        enemyLives = 3
    }
    
    private func checkResult(enemyTool: String, playerTool: String) {
        
        var result: String
        
        switch playerTool {
        case "paper":
            if enemyTool == "paper" {
                result = "Ничья"
            } else if enemyTool == "scissors" {
                result = "Проигрыш"
                playerLives -= 1
            } else {
                result = "Победа"
                enemyLives -= 1
            }
        case "stone":
            if enemyTool == "paper" {
                result = "Проигрыш"
                playerLives -= 1
            } else if enemyTool == "scissors" {
                result = "Победа"
                enemyLives -= 1
            } else {
                result = "Ничья"
            }
        case "scissors":
            if enemyTool == "paper" {
                result = "Победа"
                enemyLives -= 1
            } else if enemyTool == "scissors" {
                result = "Ничья"
            } else {
                result = "Проигрыш"
                playerLives -= 1
            }
        default:
            result = "Error"
        }
        
        print(result)
        
    }
    
    private func win() {
        let ac = UIAlertController(title: "Congrats!", message: "You win!", preferredStyle: .alert)
        let playAgainButton = UIAlertAction(title: "Play Again!", style: .default) { [weak self] _ in
            self?.reloadLevel()
        }
        let goBackButton = UIAlertAction(title: "Go back!", style: .default) { [weak self] _ in
            self?.navigationController?.popToRootViewController(animated: true)
        }
        ac.addAction(playAgainButton)
        ac.addAction(goBackButton)
        present(ac, animated: true, completion: nil)
    }
    
    private func loose() {
        let ac = UIAlertController(title: "Oh.. looks like you loose..", message: "You can try again!", preferredStyle: .alert)
        let playAgainButton = UIAlertAction(title: "Play Again!", style: .default) { [weak self] _ in
            self?.reloadLevel()
        }
        let goBackButton = UIAlertAction(title: "Go back!", style: .default) { [weak self] _ in
            self?.navigationController?.popToRootViewController(animated: true)
        }
        ac.addAction(playAgainButton)
        ac.addAction(goBackButton)
        present(ac, animated: true, completion: nil)
    }
}

