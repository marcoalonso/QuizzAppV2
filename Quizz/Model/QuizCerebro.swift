//
//  QuizCerebro.swift
//  Quizz
//
//  Created by marco rodriguez on 08/10/22.
//

import Foundation
import UIKit

struct QuizCerebro {
    //arreglo de preguntas
    let preguntas = [
        Pregunta(texto: "El punto llamado NEMO es el punto más difícil de alcanzar de todo el planeta.", respuesta: "VERDADERO", color: UIColor.black, image: UIImage(named: "1")!),
        Pregunta(texto: "Tokio siempre ha sido la capital de Japón", respuesta: "FALSO", color: UIColor.black, image: UIImage(named: "2")!),
        Pregunta(texto: "Los nativos americanos enterraban sus hachas cuando hacían las paces", respuesta: "VERDADERO", color: UIColor.black, image: UIImage(named: "3")!),
        Pregunta(texto: "El aluminio fue una vez más valioso que el oro", respuesta: "VERDADERO", color: UIColor.black, image: UIImage(named: "4")!),
        Pregunta(texto: "Bélgica ha sido independiente durante miles de años", respuesta: "FALSO", color: UIColor.black, image: UIImage(named: "belgica")!)
//        Pregunta(texto: "Ningún papa ha muerto nunca violentamente", respuesta: "FALSO", color: UIColor.black, image: UIImage(named: "papa")!),
//        Pregunta(texto: "Una ciudad perdida yace bajo el mar Mediterráneo", respuesta: "VERDADERO", color: UIColor.black, image: UIImage(named: "mar")!),
//        Pregunta(texto: "El budismo fue fundado en Japón", respuesta: "FALSO", color: UIColor.black, image: UIImage(named: "budismo")!),
//        Pregunta(texto: "El papel de aluminio amplifica el Wifi ", respuesta: "VERDADERO", color: UIColor.blue, image: UIImage(named: "aluminio")!),
//        Pregunta(texto: "Cuantos más megapíxeles, mejor calidad de imagen.", respuesta: "FALSO", color: UIColor.black, image: UIImage(named: "pixeles")!),
//        Pregunta(texto: "La construcción de la torre Eiffel se completó el 31 de marzo de 1887.", respuesta: "FALSO", color: UIColor.black, image: UIImage(named: "torre")!),
//        Pregunta(texto: "Los relámpagos se ven antes de escucharse porque la luz viaja más rápido que el sonido", respuesta: "VERDADERO", color: UIColor.black, image: UIImage(named: "rayo")!),
//        Pregunta(texto: "La penicilina fue descubierta en Vietnam para tratar la malaria.", respuesta: "FALSO", color: UIColor.black, image: UIImage(named: "penicilina")!),
//        Pregunta(texto: "El brócoli contiene más vitamina C que los limones.", respuesta: "VERDADERO", color: UIColor.black, image: UIImage(named: "brocoli")!),
//        Pregunta(texto: "Google inicialmente se llamaba BackRub.", respuesta: "VERDADERO", color: UIColor.black, image: UIImage(named: "google")!),
//        Pregunta(texto: "El cráneo es el hueso más fuerte del cuerpo humano", respuesta: "FALSO", color: UIColor.black, image: UIImage(named: "craneo")!),
//        Pregunta(texto: "Coca Cola existe en todos los países del mundo.", respuesta: "FALSO", color: UIColor.black, image: UIImage(named: "coca")!)
    ]
    
    var numPregunta : Int = 0
    var puntuacion = 0
    
    //valida la respuesta del usuario
    mutating func revisarRespuesta(respuestaUsuario: String) -> Bool {
        //validar si la respuesta es correcta
        if respuestaUsuario == preguntas[numPregunta].respuesta {
            puntuacion = puntuacion + 1 //puntuacion += 1
            print("Puntuacion: \(puntuacion)")
            return true
        } else {
            return false
        }
    }
    
    //me dará el puntaje a mostrar
    func obtenerPuntiacion() -> Int {
        return puntuacion
    }
    
    func obtenerPuntiacionString() -> String {
        return "Tu puntuacion es: \(puntuacion) pts."
    }
    
    //me dará el texto de la pregunta a mostrar
    func obtenerTextoPregunta() -> String {
        return preguntas[numPregunta].texto
    }
    
    func obtenerColor() -> UIColor {
        return preguntas[numPregunta].color
    }
    
    //el progreso del progressView, calcular el total preguntas y # pregunta
    //un valore entre 0 y 1
    func obtenerProgreso() -> Float {
        let progreso = Float(numPregunta + 1) / Float(preguntas.count)
        return progreso
    }
    
    func obtenerImagen() -> UIImage {
//        let imagen = preguntas[numPregunta].image
//        return imagen
        return preguntas[numPregunta].image
    }
    
    //Como saber si ya llegamos a la ultima pregunta?
    mutating func siguientePregunta() -> Bool {
        //si estoy en la penultima pregunta
        if numPregunta + 1 < preguntas.count {
            numPregunta =  numPregunta + 1
            print("DEBUG: numPregunta: \(numPregunta)")
            return true //indica que ya es la ultima pregunta
        } else {
            numPregunta = 0 //reset
            return false
        }
    }
    
}
