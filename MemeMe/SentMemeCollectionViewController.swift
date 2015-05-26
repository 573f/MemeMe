//
//  SentMemeCollectionViewController.swift
//  MemeMe
//
//  Created by Stephen Skubik-Peplaski on 5/25/15.
//  Copyright (c) 2015 Stephen Skubik-Peplaski. All rights reserved.
//

import UIKit

class SentMemeCollectionViewController: UICollectionViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    var memes: [Meme]!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        memes = (UIApplication.sharedApplication().delegate as! AppDelegate).memes
        self.collectionView?.reloadData()
    }
    
    @IBAction func addMeme(sender: UIBarButtonItem) {
        self.invokeEditMemeController()
    }
    
    func invokeEditMemeController() {
        let controller = self.storyboard?.instantiateViewControllerWithIdentifier("EditMemeViewController") as! EditMemeViewController
        self.presentViewController(controller, animated: true, completion: nil)
    }

     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "memeDetailFromCollection" {
            if let indexPaths = collectionView?.indexPathsForSelectedItems() as? [NSIndexPath] {
                let index = indexPaths[0].row
                let memeDetailViewController = segue.destinationViewController as! MemeDetailViewController
                memeDetailViewController.meme = memes[index]
            }
        }
    }

    // MARK: CollectionView data source methods
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = self.collectionView?.dequeueReusableCellWithReuseIdentifier(MemeCollectionCell.reuseIdentifier, forIndexPath: indexPath) as! MemeCollectionCell
        cell.memedImageView.image = memes[indexPath.item].memedImage
        cell.memedImageView.contentMode = UIViewContentMode.ScaleAspectFit
        return cell
    }
    
    // MARK: CollectionView Flow Layout methods
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: 150.0, height: 150.0)
    }

}