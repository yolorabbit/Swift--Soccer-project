//
//  ChantsViewController.swift
//  sofascore
//
//  Created by Thales Brederodes Montarroyos Candido on 22/11/23.
//

import UIKit

class ChantsViewController: UIViewController {
    
    
    //MARK: - UI
    
    private lazy var tableWw: UITableView = {
        let tv = UITableView()
        tv.translatesAutoresizingMaskIntoConstraints = false
        tv.backgroundColor = .systemBlue
        tv.rowHeight = UITableView.automaticDimension
        tv.estimatedRowHeight = 44
        tv.separatorStyle = .none
        tv.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tv.register(TeamTableViewCell.self, forCellReuseIdentifier: TeamTableViewCell.cellId)

        return tv
    }()
    
    private lazy var teamsViewModel = TeamsViewModel()
    private lazy var audioManagerViewModel = AudioManagerViewModel()
        
    
    override func loadView() {
        super.loadView()
        setup()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
    }
    

 

}

private extension ChantsViewController{
    func setup(){
        self.navigationController?.navigationBar.topItem?.title = "Football Chants"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        tableWw.dataSource = self
        self.view.addSubview(tableWw)
        NSLayoutConstraint.activate([
            tableWw.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor), tableWw.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            tableWw.leadingAnchor.constraint (equalTo:
                                                self.view.safeAreaLayoutGuide.leadingAnchor),
            tableWw.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor
                                             )])
    }
}

//MARK: - UITableViewDataSource
extension ChantsViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  teamsViewModel.teams.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let item = teamsViewModel.teams[indexPath.row]
        let cell = tableWw.dequeueReusableCell(withIdentifier: TeamTableViewCell.cellId, for: indexPath) as! TeamTableViewCell
        cell.configure(item,delegate:self)
        return cell
      
    }
    
    
    
}

extension ChantsViewController:TeamTableViewCellDelegate{
    func didTapPlayback(for team: Team) {
        audioManagerViewModel.playback(team)
        teamsViewModel.tooglePlayback(for: team)
        tableWw.reloadData()
    }
    
    
}
