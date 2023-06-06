//
//  OnboardingView.swift
//  UiKit2-AutoLayout
//
//  Created by Alexis Vilchis on 06/06/23.
//

import Foundation
import UIKit

final class OnboardingView: UIView {
    private let onboardingImageView: UIImageView = {
        let imageView = UIImageView() //Crear instancia de imageView
        imageView.contentMode = .scaleAspectFit //Escalar
        imageView.image = UIImage(named: "rickandmorty") //Inicializar imageView con imagen
        imageView.translatesAutoresizingMaskIntoConstraints = false //PErmite añadir contraints por codigo, cada que creemos una vista por codigo
        return imageView
    }()
    
    private let textLabel: UILabel = {
        let label = UILabel() //Crear la instancia UILAbel
        label.numberOfLines = 0
        label.textAlignment = .center
        label.text = "Bienvenidos a la APP de Rick and Morty"
        label.font = UIFont(name: "Arial Rounded MT Bold", size: 26)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var skipOnBoardingButton: UIButton = {
        var config = UIButton.Configuration.filled()
        config.title = "Pulsa para continuar"
        config.subtitle = "Onboarding"
        
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(showMessage), for: .touchUpInside)
        button.configuration = config
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup(){
        addSubViews()
        configureConstraints()
    }
    
    private func addSubViews(){
        //AÑadir la subvista creada a la vista padre
        [onboardingImageView, textLabel, skipOnBoardingButton]
            .forEach(addSubview)
    }
    
    private func configureConstraints(){
        //Agregar constrints de la subview
        //Array de constraints
        NSLayoutConstraint.activate([
            onboardingImageView.bottomAnchor.constraint(equalTo: textLabel.topAnchor, constant: -32),
            onboardingImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            onboardingImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            
            textLabel.bottomAnchor.constraint(equalTo: skipOnBoardingButton.topAnchor, constant: -42),
            textLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            textLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            
            skipOnBoardingButton.centerXAnchor.constraint(equalTo: centerXAnchor),
            skipOnBoardingButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])

    }
    
    @objc func showMessage(){
        print("Skip onboarding")
    }
}
