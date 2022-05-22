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

let post1 = Post(imageName: "ASB", author: "Сергей Иванов", description: "Накрыло где-то около Барстоу, у края пустыни. Помню, как сказал что-то вроде: «У меня голова кружится, садись ты за руль». И вдруг со всех сторон послышался жуткий рев, небо заполонили какие-то огромные летучие мыши, с визгом пикировавшие и взмывавшие вокруг нашего кабриолета, который с опущенной крышей мчался в Лас-Вегас со скоростью сто шестьдесят километров в час. Раздался вопль: «О, господи! Что это за твари?!»", likes: "320", views: "750")
let post2 = Post(imageName: "ME1", author: "Иван Петров", description: "Потом всё стихло. Мой адвокат сидел без рубашки и поливал грудь пивом, чтобы ускорить процесс загара. «Чего разорался?», — пробурчал он, подставив солнцу лицо в облегающих темных испанских очках. «Проехали, — ответил я. — Твоя очередь вести». Я затормозил и направил Большую Красную Акулу на обочину шоссе. Незачем рассказывать ему про мышей, подумал я, сам скоро увидит.", likes: "222", views: "333")
let post3 = Post(imageName: "DAO", author: "Хантер Томпсон", description: "Был почти полдень, а нам еще предстояло преодолеть больше сотни миль. Тяжелых миль. Очень скоро, я знал, нам обоим напрочь снесет крышу. Но возвращаться нельзя, а отдыхать некогда. Придется перетерпеть. Регистрация репортеров на феерическую мотогонку «Минт-400» уже началась, и чтобы получить свой звуконепроницаемый номер-люкс нужно добраться туда до четырех. О брони позаботился солидный спортивный журнал из Нью-Йорка, он же выдал денег, на которые мы только что взяли напрокат на Сансет-стрип этот огромный красный кабриолет «Шевроле». И, в конце концов, я — профессиональный журналист и должен подготовить репортаж, чего бы мне это не стоило.", likes: "239", views: "245")
let post4 = Post(imageName: "TW1", author: "Валентин Машутин", description: "Редакция также выдала мне 300 долларов наличными, и почти все они были уже израсходованы на чрезвычайно опасные вещества. Наш багажник напоминал мобильный склад конфиската наркополиции. У нас было два мешка травы, семьдесят пять катышков мескалина, пять листов промокашки с мощной кислотой, полсолонки кокаина и целый арсенал разноцветных таблеток: разогнаться, притормозить, повопить и посмеяться … а еще кварта текилы, кварта рома, ящик «Бадвайзера», пинта чистого эфира и две дюжины капсул амилнитрита.", likes: "999", views: "999")


final class ProfileViewController: UIViewController {
    
    let postCellID = "postCell"
    let photosCellID = "photosCell"
    
    var posts = [post1, post2, post3, post4]
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let tapGestureRecognizer = UITapGestureRecognizer()
    private var isExpanded = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        activateConstraints()
    }
    
    func setupTableView() {
        self.view.backgroundColor = .white
        navigationItem.title = "Custom Cell"
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: postCellID)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: photosCellID)
    }
    
    func activateConstraints() {
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
        if indexPath.row == 0 {
            let photosCell = tableView.dequeueReusableCell(withIdentifier: photosCellID, for: indexPath)
            return photosCell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: postCellID, for: indexPath) as! PostTableViewCell
            let post = posts[indexPath.row - 1]
            cell.post = post
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if indexPath.row == 0 {
            let photosVC = PhotosViewController()
            navigationController?.pushViewController(photosVC, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count + 1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return ProfileHeaderView()
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
       return 270
    }
   
}
