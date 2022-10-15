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
    

    var quizcerebro = QuizCerebro()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //pintar el progreso del PV
        progresoQuizzPV.progress = quizcerebro.obtenerProgreso()
        
        //pintar texto pregunta
        textoPreguntaLabel.text = quizcerebro.obtenerTextoPregunta()
        
        //pintar imagen pregunta
        imagenPregunta.image = quizcerebro.obtenerImagen()
        
        //pintar el puntaje
        puntajeLabel.text = "Puntaje: \(quizcerebro.obtenerPuntiacion()) pts."
//        puntajeLabel.text = quizcerebro.obtenerPuntiacionString()
        
        imagenPregunta.layer.cornerRadius = 20
        imagenPregunta.clipsToBounds = true
    }
    
    @IBAction func contestarPreguntaButton(_ sender: UIButton) {
        print(sender.titleLabel?.text ?? "VERDADERO")
        //obtener la resp del usuario
        let respuestaUsuario = sender.titleLabel?.text ?? "FALSO"
        
        let respuestaCorrecta = quizcerebro.revisarRespuesta(respuestaUsuario: respuestaUsuario)
        
        //si es true
        if respuestaCorrecta {
            sender.backgroundColor = UIColor.green
            
        } else {
            sender.backgroundColor = UIColor.red
            
        }
        
        botonFalso.isEnabled = false
        botonVerdadero.isEnabled = false
        
        //validar si hay mas preguntas
        if quizcerebro.siguientePregunta() {
            //Delay o timer
            Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(cambiarPregunta), userInfo: nil, repeats: false)
        } else {
            print("DEBUG: Fin del quiz")
            //crear una Alerta
            let alerta = UIAlertController(title: "Fin del Quizz", message: "¿Quieres interntar de nuevo?", preferredStyle: .actionSheet)
            
            let accionAceptar = UIAlertAction(title: "Si, empezar de nuevo", style: .default) { UIAlertAction in
                
                self.quizcerebro.puntuacion = 0
                Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(self.cambiarPregunta), userInfo: nil, repeats: false)
            }
            
            let boton = UIAlertAction(title: "No", style: .destructive)
            
            alerta.addAction(accionAceptar)
            alerta.addAction(boton)
            
            present(alerta, animated: true)
            
        }
        
        
        
        
    }
    
    @objc func cambiarPregunta() {
        //actualizar el puntaje, el texto de la pregunta, la imagen, el progreso,
        textoPreguntaLabel.text = quizcerebro.obtenerTextoPregunta()
        textoPreguntaLabel.textColor = quizcerebro.obtenerColor()
        puntajeLabel.text = quizcerebro.obtenerPuntiacionString()
        imagenPregunta.image = quizcerebro.obtenerImagen()
        progresoQuizzPV.progress = quizcerebro.obtenerProgreso()
        
        
        //reset el color,
        botonVerdadero.backgroundColor = UIColor.white
        botonFalso.backgroundColor = UIColor.white
        
        //habilitar de nuevo los botones
        botonVerdadero.isEnabled = true
        botonFalso.isEnabled = true
        
    }

}

