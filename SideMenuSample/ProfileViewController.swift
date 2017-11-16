//
//  RightViewController.swift
//  SideMenuSample
//
//  Created by sandeep on 15/11/17.
//  Copyright © 2017 Evontech. All rights reserved.
//

import UIKit
import QuartzCore

class ProfileViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let tableRowHeight:CGFloat = 60.0 * heightMultiplier
    let tableProfileMenu = UITableView()
    let allItems = [["My account", "My dashboard", "Switch account"], ["Settings", "Terms & privacy policy", "Feedback", "Help center"]]
    var arrayMenuItems = [[String]]()
    let tableCellIdentifier = "ProfileCell"
    
    var heightConstraint : NSLayoutConstraint?
    var horizontalSpacing : NSLayoutConstraint?
    
    lazy var  imageViewAvatar:UIImageView = {
        
        let imageView = UIImageView(image: UIImage(named: "test"))
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.autoresizesSubviews = false
        imageView.layer.masksToBounds = true
        imageView.clipsToBounds = true
        return imageView
    }()

    lazy var lblUsername:UILabel = {
        let username = UILabel()
        username.translatesAutoresizingMaskIntoConstraints = false
        username.numberOfLines = 1
        username.font = UIFont.systemFont(ofSize: 18*widthMultiplier) // variation in font size according to device width. taking 6/6s for comparison
        username.adjustsFontSizeToFitWidth = true
        username.textColor = .white
        username.alpha = 0.0
        return username
    }()
    
    lazy var profileProgressBar:UIProgressView = {
        
       let progressView = UIProgressView(progressViewStyle: .default)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        progressView.trackTintColor = .green
        progressView.tintColor = .blue
        progressView.progress = 0.5
        progressView.alpha = 0.0
        return progressView
    }()
    
    lazy var lblSpaceUsage:UILabel = {
        let lblCaption = UILabel()
        lblCaption.translatesAutoresizingMaskIntoConstraints = false
        lblCaption.numberOfLines = 1
        lblCaption.adjustsFontSizeToFitWidth = true
        lblCaption.font = UIFont.systemFont(ofSize: 12.0*widthMultiplier) // variation in font size according to device width. taking 6/6s for comparison
        lblCaption.alpha = 0.0
        lblCaption.textColor = .lightGray
        return lblCaption
    }()
    
    // adding object; one time addition only
    override func viewDidLoad() {
        super.viewDidLoad()

        for _ in 0..<allItems.count{
            
            arrayMenuItems.append([])
        }
        createAndAddTopImageBar()
        self.createAndAddTableView()
    }
    
    //Creating and adding the profile image with username and caption
    func createAndAddTopImageBar(){
        
        self.view.addSubview(imageViewAvatar)
        imageViewAvatar.image = UIImage(named: "profile_sample")
        imageViewAvatar.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true
        imageViewAvatar.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
        heightConstraint = imageViewAvatar.heightAnchor.constraint(equalToConstant: 0)
        imageViewAvatar.widthAnchor.constraint(equalTo: imageViewAvatar.heightAnchor, multiplier: 1.0, constant: 0).isActive = true
        heightConstraint?.isActive = true
        imageViewAvatar.backgroundColor = .red
        
        self.view.addSubview(lblUsername)
        lblUsername.text = "Kanye West" // You set data later.
        lblUsername.topAnchor.constraint(equalTo: imageViewAvatar.topAnchor, constant: 0).isActive = true
        horizontalSpacing = lblUsername.leadingAnchor.constraint(equalTo: imageViewAvatar.trailingAnchor, constant: 20)
        lblUsername.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20)
        horizontalSpacing?.isActive = true
        
        
        self.view.addSubview(profileProgressBar)
        profileProgressBar.topAnchor.constraint(equalTo: lblUsername.bottomAnchor, constant: 5).isActive = true
        profileProgressBar.leadingAnchor.constraint(equalTo: lblUsername.leadingAnchor, constant: 0).isActive = true
        profileProgressBar.widthAnchor.constraint(equalToConstant: sideMenuVisibilityWidth-150).isActive = true
        print("frame of profile bar is \(lblUsername.frame)")
        
        self.view.addSubview(lblSpaceUsage)
        lblSpaceUsage.text = "caption here" // You set data later.
        lblSpaceUsage.topAnchor.constraint(equalTo: profileProgressBar.bottomAnchor, constant: 5).isActive = true
        lblSpaceUsage.leadingAnchor.constraint(equalTo: profileProgressBar.leadingAnchor, constant: 0).isActive = true
    }
    
    
    func createAndAddTableView() -> Void {
        
        self.view.addSubview(tableProfileMenu)
        tableProfileMenu.translatesAutoresizingMaskIntoConstraints = false
        tableProfileMenu.separatorStyle = .none
        tableProfileMenu.register(ProfileTableViewCell.self, forCellReuseIdentifier: tableCellIdentifier)
        tableProfileMenu.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 0).isActive = true
        tableProfileMenu.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: 0).isActive = true
        tableProfileMenu.topAnchor.constraint(equalTo: lblSpaceUsage.bottomAnchor, constant: 50).isActive = true
        tableProfileMenu.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        tableProfileMenu.delegate = self
        tableProfileMenu.dataSource = self;
        tableProfileMenu.backgroundColor = .clear
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .darkGray
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    func loadData(){
        
        for index in 0..<arrayMenuItems.count{
            
            arrayMenuItems[index].removeAll()
        }
        tableProfileMenu.reloadData()
        
        self.lblUsername.alpha = 0.0
        self.profileProgressBar.alpha = 0.0
        self.lblSpaceUsage.alpha = 0.0

        heightConstraint?.constant = 0.0
        horizontalSpacing?.constant = self.view.frame.size.width
        self.view.layoutIfNeeded()
        self.animateHeader() // header animation
    }
    
    
    // function will insert the rows to table
    func insertRowsToTable(rowIndex:Int, rowSection:Int) {
        
        guard rowSection < allItems.count else {return}
        let indexPath = IndexPath(row: rowIndex, section: rowSection)
        arrayMenuItems[rowSection].append(allItems[rowSection][rowIndex]) // inserting to new array
        tableProfileMenu.insertRows(at: [indexPath], with: .right)
        
        DispatchQueue.main.asyncAfter(deadline: .now()+0.035) {
            if rowIndex < self.allItems[rowSection].count - 1{
                self.insertRowsToTable(rowIndex: rowIndex+1, rowSection: rowSection)
            }
            else{
                self.insertRowsToTable(rowIndex: 0, rowSection: rowSection+1)
            }
        }
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: Table Methods
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        return arrayMenuItems[section].count
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int{
        
        return allItems.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        
        return tableRowHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let tableCell:ProfileTableViewCell? = tableView.dequeueReusableCell(withIdentifier: tableCellIdentifier) as? ProfileTableViewCell
        tableCell?.backgroundColor = .clear
        tableCell?.contentView.backgroundColor = .clear
        tableCell?.setData(data: arrayMenuItems[indexPath.section][indexPath.row], indexPath: indexPath)
        tableCell?.createAndAddDivider(forIndexPath: indexPath)
        return tableCell!
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
        tableView.deselectRow(at: indexPath, animated: true)
        let mainViewController = sideMenuController!
        mainViewController.hideRightView(animated: true, completionHandler: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
