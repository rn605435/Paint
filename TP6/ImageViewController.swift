//
//  ImageViewController.swift
//  TP6
//
//  Created by ROCHETTE Nicolas on 11/12/2018.
//  Copyright © 2018 ROCHETTE Nicolas. All rights reserved.
//

import Cocoa

class ImageViewController: NSViewController {
    
    
    //OUTLETS
    @IBOutlet weak var fenetrePrincipale: NSWindow!
    @IBOutlet weak var vueImage: ImageView?
    @IBOutlet weak var scrollView: NSScrollView!
    @IBOutlet weak var panelOutils: NSPanel!
    
    @IBOutlet weak var btnTriangle: NSButton!
    @IBOutlet weak var btnCercle: NSButton!
    @IBOutlet weak var btnRectangle: NSButton!
    @IBOutlet weak var btnRemplissage: NSButton!
    
    @IBOutlet weak var colorWellTrait: NSColorWell!
    @IBOutlet weak var colorWellRemplissage: NSColorWell!
    //FIN OUTLETS
    
    
    
    var imageURL: URL? {
        didSet {
            if imageURL != nil {
                let monImage = NSImage(contentsOf: imageURL!)!
                
                // Redimentionnement automatique de la fenêtre en fonction de l'image chargée
                vueImage?.image = monImage
                vueImage?.setFrameSize(monImage.size)
                fenetrePrincipale?.setContentSize(NSSize(width: monImage.size.width, height: monImage.size.height))
                scrollView?.setFrameSize(NSSize(width: monImage.size.width + 3, height: monImage.size.height + 3))
            }
        }
    }
    //ACTIONS
    @IBAction func ouvrirFichier(_ sender: AnyObject) {
        let openPanel = NSOpenPanel()
        openPanel.allowsMultipleSelection = false
        openPanel.canChooseFiles = true
        openPanel.canChooseDirectories = false
        openPanel.title = "Choisir une image"
        openPanel.runModal()
        imageURL = openPanel.url
    }
    @IBAction func undoCircle(_ sender: Any) {
        vueImage?.enleverDerniereForme()
    }
    @IBAction func removeCircles(_ sender: Any) {
        vueImage?.viderFormes()
    }
    
    @IBAction func remplissage(_ sender: Any) {
        vueImage?.remplir = btnRemplissage.state.rawValue == 1 ? true : false
    }
    @IBAction func changerCouleurTrait(_ sender: Any) {
        vueImage?.couleurTrait = colorWellTrait.color
    }
    
    @IBAction func changerCouleurRemplissage(_ sender: Any) {
        vueImage?.couleurRemplissage = self.colorWellRemplissage.color
    }
    
    @IBAction func dessinerCercle(_ sender: Any) {
        vueImage?.etatForme = Etats.creationCercle
        btnRectangle.state = NSControl.StateValue.off
        btnTriangle.state = NSControl.StateValue.off
    }
    
    @IBAction func dessinerCarre(_ sender: Any) {
        vueImage?.etatForme = Etats.creationCarre
        btnCercle.state = NSControl.StateValue.off
        btnTriangle.state = NSControl.StateValue.off
    }
    
    @IBAction func dessinerTriangle(_ sender: Any) {
        vueImage?.etatForme = Etats.creationTriangle
        btnRectangle.state = NSControl.StateValue.off
        btnCercle.state = NSControl.StateValue.off
    }
   
    
    //FIN ACTIONS
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let monImage = NSImage(named: "fox") {
            vueImage?.image = monImage
            vueImage?.setFrameSize(monImage.size)
        }
        else {
            fatalError("Image non trouvée")
        }
    }
    
    
    
}
