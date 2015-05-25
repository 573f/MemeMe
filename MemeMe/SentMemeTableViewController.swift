//
//  SentMemeTableViewController.swift
//  MemeMe
//
//  Created by Stephen Skubik-Peplaski on 5/25/15.
//  Copyright (c) 2015 Stephen Skubik-Peplaski. All rights reserved.
//

import Foundation
import UIKit

class SentMemeTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    
    var memes: [Meme]!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        memes = (UIApplication.sharedApplication().delegate as! AppDelegate).memes
        
        if (memes.count == 0) {self.invokeEditMemeController()}
        self.tableView.reloadData()
    }
    
    @IBAction func addMeme(sender: UIBarButtonItem) {
        self.invokeEditMemeController()
    }
    
    func invokeEditMemeController() {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("EditMemeViewController") as! EditMemeViewController
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    // MARK: tableView dataSource methods
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NSLog("Memes: %d", memes.count)
        return memes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        NSLog("Getting cell for row %d", indexPath.row)
        let cell = tableView.dequeueReusableCellWithIdentifier("memeTableCell") as! UITableViewCell
        let meme = self.memes[indexPath.row]
        
        // Set the name and image
        cell.textLabel?.text = meme.topText + "..." + meme.bottomText
        cell.imageView?.image = meme.memedImage
        
        return cell
    }
}