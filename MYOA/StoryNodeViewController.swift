//
//  StoryNodeViewController.swift
//  MYOA
//
//  Created by Jarrod Parkes on 11/2/14.
//  Copyright (c) 2014 Udacity. All rights reserved.
//

import UIKit

// MARK: - StoryNodeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource

class StoryNodeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: Properties
    
    var storyNode: StoryNode!
    
    // MARK: Outlets
    
    @IBOutlet weak var adventureImageView: UIImageView!
    @IBOutlet weak var messageTextView: UITextView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var restartButton: UIButton!
    
    // MARK: Life Cycle
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Set the image
        if let imageName = storyNode.imageName {
            self.adventureImageView.image = UIImage(named: imageName)
        }
        
        // Set the message text
        self.messageTextView.text = storyNode.message
        
        // Hide the restart button if there are choices to be made
        restartButton.isHidden = storyNode.promptCount() > 0
    }
    
    // MARK: Table Placeholder Implementation
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Get a StoryNodeController from the Storyboard
        let storyNodeController = self.storyboard!.instantiateViewController(withIdentifier: "StoryNodeViewController")as! StoryNodeViewController
        
        // Set the story node so that we will see the start of the story
        storyNodeController.storyNode = storyNode.storyNodeForIndex(index: (indexPath as NSIndexPath).row)
        
        // Push the new controller onto the stack
        self.navigationController!.pushViewController(storyNodeController, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return storyNode.promptCount()
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")! 

        cell.textLabel!.text = storyNode.promptForIndex((indexPath as NSIndexPath).row)
        
        return cell
    }

    // MARK: Actions
    
    @IBAction func restartStory() {
        let controller = self.navigationController!.viewControllers[1] 
        let _ = self.navigationController?.popToViewController(controller, animated: true)
    }
}
