//
//  ViewController.swift
//  Quizz
//
//  Created by marco rodriguez on 08/10/22.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var botonFalso: UIButton!
    @IBOutlet weak var imagenPregunta: UIImageView!
    @IBOutlet weak var botonVerdadero: UIButton!
    @IBOutlet weak var puntajeLabel: UILabel!
    @IBOutlet weak var progresoQuizzPV: UIProgressView!
    @IBOutlet weak var textoPreguntaLabel: UILabel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagenPregunta.layer.cornerRadius = 20
        imagenPregunta.clipsToBounds = true
    }
    
    
    @IBAction func contestarPreguntaButton(_ sender: UIButton) {
        print(sender.titleLabel?.text ?? "VERDADERO")
    }
    

}

