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
    var appDelegate: AppDelegate!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)

        appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        memes = appDelegate.memes
        
        if (memes.count == 0 && appDelegate.firstLaunch) {
            self.invokeEditMemeController()
            appDelegate.firstLaunch = false
        }
        self.tableView.reloadData()
    }
    
    @IBAction func addMeme(sender: UIBarButtonItem) {
        self.invokeEditMemeController()
    }
    
    func invokeEditMemeController() {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("EditMemeViewController") as! EditMemeViewController
        self.presentViewController(controller, animated: true, completion: nil)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "memeDetailFromTable" {
            if let indexPaths = tableView?.indexPathsForSelectedRows() as? [NSIndexPath] {
                let index = indexPaths[0].row
                let memeDetailViewController = segue.destinationViewController as! MemeDetailViewController
                memeDetailViewController.meme = memes[index]
            }
        }
    }
    
    // MARK: tableView dataSource methods
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("memeTableCell") as! UITableViewCell
        let meme = self.memes[indexPath.row]
        
        // Set the name and image
        cell.textLabel?.text = meme.topText + "..." + meme.bottomText
        cell.imageView?.image = meme.memedImage
        
        return cell
    }
}