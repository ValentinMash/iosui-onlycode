//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Valentin Mashutin on 03.05.2022.
//

import UIKit

struct Post {
    let imageName: String
    let author: String
    let description: String
    let likes: String
    let views: String
}

let post1 = Post(imageName: "ASB", author: "Виталий Красновид", description: "Флорентийскому ассасину Рим очень понравился. Впервые в городе, а его встречает сам папа римский, что-то бормочущий о мировом господстве! Побегали по тайным комнатам, подрались на кулаках, да еще и с богиней встретились — после такого теплого приема грех не заглянуть сюда еще раз.", likes: "280", views: "400")
let post2 = Post(imageName: "ME1", author: "Тимур Хорев", description: "С первых секунд игра кажется смутно знакомой. Возможно, дело в типажах — вот сам герой с внешностью голливудского спасителя мира, вот старый вояка — отец солдатам, вот пилот от бога — носит бейсболку и постоянно язвит, но посмотрите, как он водит «Нормандию» !", likes: "445", views: "503")
let post3 = Post(imageName: "DAO", author: "Андрей Ленский", description: "Скажем прямо: в игровой механике расам уделено мало значения. Четыре плюсика к характеристикам — это смешно, вы за каждый уровень будете получать по +3, а всего этих уровней 20. Вот разве что гномы — которым запрещено быть магами — получают в качестве компенсации 10%-ный шанс отразить вражеские чары. Приятно, но 10% — не та вероятность, на которую стоит полагаться.", likes: "239", views: "245")
let post4 = Post(imageName: "TW1", author: "Михаил Иванов", description: "Банки, склянки, пробирки — казалось бы, скорее удел почтенного профессора (быть может, сумасшедшего), а не храброго воина. Но ведьмак — все же не обычный рубака, да и задачи перед ним стоят не тривиальные; его враги обычному человеку не под силу. Вот и приходится не только уметь, но и знать куда больше, чем можно было бы предположить на первый взгляд. И все эти необходимые знания после острого приступа смерти приходится получать заново нелегким трудом.", likes: "146", views: "304")

var posts = [post1, post2, post3, post4]


final class ProfileViewController: UIViewController {
    
    let cellID = "cellID"
    
    var tableView: UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        layout()
    }
    
    func setupTableView() {
        self.view.backgroundColor = .white
        navigationItem.title = "Custom Cell"
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: cellID)
    }
    
    func layout() {
        view.addSubview(tableView)
        
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        
        tableView.reloadData()
    }
}

extension ProfileViewController: UITableViewDelegate { }

extension ProfileViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! PostTableViewCell
        
        let post = posts[indexPath.row]
        cell.post = post
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return ProfileHeaderView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       return 270
    }
    
    func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        return false
    }
    
}
