//
//  TeamTableViewCell.swift
//  sofascore
//
//  Created by Thales Brederodes Montarroyos Candido on 22/11/23.
//

import UIKit


protocol TeamTableViewCellDelegate: class{
    func didTapPlayback(for team:Team)
}

class TeamTableViewCell: UITableViewCell {
    
    static let cellId = "TeamTableViewCell"
    
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.team = nil
        self.delegate = nil
        self.contentView.subviews.forEach{$0.removeFromSuperview()}
    }
    
    private lazy var containerVw:UIView = {
        let vw = UIView()
        vw.translatesAutoresizingMaskIntoConstraints = false
        return vw
    }()
    

    
    private lazy var contentStackVw:UIStackView = {
        let stackVwv = UIStackView()
        stackVwv.translatesAutoresizingMaskIntoConstraints=false
        stackVwv.spacing = 4
        stackVwv.axis = .vertical
        return stackVwv
    }()
    
    
    private lazy var badgeImgVw: UIImageView = {
        let imgVw = UIImageView()
            imgVw.translatesAutoresizingMaskIntoConstraints = false
            imgVw.contentMode = .scaleAspectFit
            return imgVw
    }()
    
    private lazy var badgeImgVw2: UIImageView = {
        let imgVw = UIImageView()
            imgVw.translatesAutoresizingMaskIntoConstraints = false
            imgVw.contentMode = .scaleAspectFit
            return imgVw
    }()
    
    private lazy var playbackBtn:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.tintColor = .white
        return btn
    }()
    
    private lazy var playbackBtn2:UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints=false
        btn.tintColor = .blue
        return btn
    }()
    
    
    
    
    private lazy var nameLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 18, weight: .bold)
        lbl.textColor = .white
        return lbl
    }()
    
    private lazy var foundedLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 18, weight: .light)
        lbl.textColor = .white
        return lbl
    }()
    
    private lazy var foundedLbl2: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 18, weight: .light)
        lbl.textColor = .white
        return lbl
    }()
    
    private lazy var jobLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 18, weight: .medium)
        lbl.textColor = .white
        return lbl
    }()
    
    
    private lazy var infoLbl: UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.numberOfLines = 0
        lbl.font = .systemFont(ofSize: 18, weight: .medium)
        lbl.textColor = .white
        return lbl
    }()
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        containerVw.layer.cornerRadius = 10
    }
    
    private weak var delegate: TeamTableViewCellDelegate?
    private var team:Team?
    
    
    func configure(_ item:Team, delegate:TeamTableViewCellDelegate){
        
        self.team = item
        self.delegate = delegate
         
        playbackBtn.addTarget(self, action: #selector(didTapPlayback), for: .touchUpInside)
        
        containerVw.backgroundColor = item.id.background
        
        nameLbl.text = item.name
        foundedLbl.text = item.founded
        foundedLbl2.text = "10th place"
        jobLbl.text = item.manager.name + item.manager.job.rawValue
        infoLbl.text = item.info
        
        
        badgeImgVw.image = item.id.badge
        badgeImgVw2.image = item.id.badge

        
        playbackBtn.setImage(item.isPlaying ? Assets.pause : Assets.play ,for:.normal)
        playbackBtn2.setImage(UIImage(systemName: "play.circle.fill", withConfiguration: UIImage.SymbolConfiguration(pointSize:32)),for:.normal)
        
        let test = UIStackView()
        test.translatesAutoresizingMaskIntoConstraints=false
        test.spacing = 4
        test.axis = .vertical
        
        
        self.contentView.addSubview(containerVw)
        containerVw.addSubview(contentStackVw)
        containerVw.addSubview(badgeImgVw)
        containerVw.addSubview(badgeImgVw2)
        containerVw.addSubview(test)
        
        
            
        test.addArrangedSubview(playbackBtn)
        test.addArrangedSubview(playbackBtn2)
        contentStackVw.addArrangedSubview(nameLbl)
        contentStackVw.addArrangedSubview(foundedLbl2)
        contentStackVw.addArrangedSubview(foundedLbl)
        contentStackVw.addArrangedSubview(jobLbl)
        contentStackVw.addArrangedSubview(infoLbl)
        
        NSLayoutConstraint.activate([
            containerVw.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant:8),
            containerVw.bottomAnchor.constraint (equalTo: self.contentView.bottomAnchor, constant:-8),
            containerVw.leadingAnchor.constraint (equalTo: self.contentView.leadingAnchor, constant:8),
            containerVw.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant:-8),
            
            badgeImgVw.heightAnchor.constraint (equalToConstant: 50),
            badgeImgVw.widthAnchor.constraint (equalToConstant: 50),
            badgeImgVw.topAnchor.constraint (equalTo: contentStackVw.topAnchor),
            badgeImgVw.leadingAnchor.constraint (equalTo: containerVw.leadingAnchor, constant: 8), contentStackVw.topAnchor.constraint (equalTo: containerVw.topAnchor, constant: 16), contentStackVw.bottomAnchor.constraint(equalTo: containerVw.bottomAnchor, constant: -16),
            contentStackVw.leadingAnchor.constraint(equalTo: badgeImgVw.trailingAnchor, constant: 8), contentStackVw.trailingAnchor.constraint(equalTo: test.leadingAnchor, constant: -8),
            playbackBtn.heightAnchor.constraint(equalToConstant: 44),
            playbackBtn.widthAnchor.constraint (equalToConstant: 44),
            playbackBtn2.heightAnchor.constraint(equalToConstant: 44),
            playbackBtn2.widthAnchor.constraint (equalToConstant: 44),
            test.trailingAnchor.constraint(equalTo: containerVw.trailingAnchor, constant: -8),
            test.centerYAnchor.constraint(equalTo: containerVw.centerYAnchor),
       
            badgeImgVw2.centerXAnchor.constraint(equalTo: badgeImgVw.centerXAnchor),
            badgeImgVw2.topAnchor.constraint(equalTo: badgeImgVw.bottomAnchor, constant: 12)
        ]
        )
    }
    
    @objc func didTapPlayback(){
        if let team = team{
            delegate?.didTapPlayback(for: team)
        }
     
    }
    
}
