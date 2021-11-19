//
//  ButtonDelegate.swift
//  ViperCalculator
//
//  Created by Сергей Лукичев on 19.11.2021.
//

import Foundation

protocol ButtonDelegate: AnyObject {
    func returnedValue(value: String)
}
