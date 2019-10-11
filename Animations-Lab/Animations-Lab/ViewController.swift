//
//  ViewController.swift
//  AnimationsPractice
//
//  Created by Benjamin Stone on 10/8/19.
//  Copyright © 2019 Benjamin Stone. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//MARK: - PROGRAMMATIC VIEWS
    lazy var blueSquare: UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }()
    
    //MARK: - UP & DOWN BUTTONS & STACK VIEWS
    lazy var buttonStackView: UIStackView = {
        let buttonStack = UIStackView()
        buttonStack.axis = .horizontal
        buttonStack.alignment = .center
        buttonStack.distribution = .equalSpacing
        buttonStack.spacing = 5
        return buttonStack
    }()
    
    lazy var upButton: UIButton = {
        let button = UIButton()
        button.setTitle("Move square up", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(animateSquareUp(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var downButton: UIButton = {
        let button = UIButton()
        button.setTitle("Move square down", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .cyan
        button.addTarget(self, action: #selector(animateSquareDown(sender:)), for: .touchUpInside)
        return button
    }()
    
    //MARK: - RIGHT & LEFT BUTTONS & STACK VIEWS
    
    lazy var buttonStackViewLR: UIStackView = {
        let buttonStack = UIStackView()
        buttonStack.axis = .horizontal
        buttonStack.alignment = .center
        buttonStack.distribution = .equalSpacing
        buttonStack.spacing = 5
        return buttonStack
    }()
    
    lazy var leftButton: UIButton = {
        let button = UIButton()
        button.setTitle("Move square left", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(animateSquareLeft(sender:)), for: .touchUpInside)
        return button
    }()
    
    lazy var rightButton: UIButton = {
        let button = UIButton()
        button.setTitle("Move square right", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(animateSquareRight(sender:)), for: .touchUpInside)
        return button
    }()
    
        //MARK: - STEPPERS
    lazy var animationStepper: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 5
        stepper.addTarget(self, action: #selector(animationStepperPressed), for: .valueChanged)
        return stepper
    }()
    
    
    lazy var blueSquareHeightConstaint: NSLayoutConstraint = {
        blueSquare.heightAnchor.constraint(equalToConstant: 200)
    }()
    
    lazy var blueSquareWidthConstraint: NSLayoutConstraint = {
        blueSquare.widthAnchor.constraint(equalToConstant: 200)
    }()
    
    lazy var blueSquareCenterXConstraint: NSLayoutConstraint = {
        blueSquare.centerXAnchor.constraint(equalTo: view.centerXAnchor)
    }()
    
    lazy var blueSquareCenterYConstraint: NSLayoutConstraint = {
        blueSquare.centerYAnchor.constraint(equalTo: view.centerYAnchor)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubviews()
        configureConstraints()
    }
    
    //MARK: - IBACTIONS
    @IBAction func animateSquareUp(sender: UIButton) {
        let oldOffset = blueSquareCenterYConstraint.constant
        blueSquareCenterYConstraint.constant = oldOffset - 150
        UIView.animate(withDuration: animationStepper.value) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func animateSquareDown(sender: UIButton) {
        let oldOffet = blueSquareCenterYConstraint.constant
        blueSquareCenterYConstraint.constant = oldOffet + 150
        UIView.animate(withDuration: animationStepper.value) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func animateSquareLeft(sender: UIButton) {
        let oldOffet = blueSquareCenterXConstraint.constant
        blueSquareCenterXConstraint.constant = oldOffet - 150
        UIView.animate(withDuration: animationStepper.value) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    
    @IBAction func animateSquareRight(sender: UIButton) {
        let oldOffet = blueSquareCenterXConstraint.constant
        blueSquareCenterXConstraint.constant = oldOffet + 150
        UIView.animate(withDuration: animationStepper.value) { [unowned self] in
            self.view.layoutIfNeeded()
        }
    }
    
    //MARK: - PRIVATE FUNCTIONS
    private func addSubviews() {
        view.addSubview(blueSquare)
        addStackViewSubviews()
        view.addSubview(buttonStackView)
        view.addSubview(buttonStackViewLR)
        view.addSubview(animationStepper)
    }
    
    private func addStackViewSubviews() {
        buttonStackView.addSubview(upButton)
        buttonStackView.addSubview(downButton)
        buttonStackViewLR.addSubview(leftButton)
        buttonStackViewLR.addSubview(rightButton)
    }
    
    private func configureConstraints() {
        constrainBlueSquare()
        constrainUpButton()
        constrainDownButton()
        constrainLeftButton()
        constrainRightButton()
        constrainButtonStackView()
        constrainButtonStackViewLR()
        constrainAnimationStepper()
    }
    
    /// CONSTRAINTS FOR BUTTONS
    private func constrainUpButton() {
        upButton.translatesAutoresizingMaskIntoConstraints = false
        
        upButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        upButton.trailingAnchor.constraint(equalTo: buttonStackView.trailingAnchor).isActive = true
    }
    
    private func constrainDownButton() {
        downButton.translatesAutoresizingMaskIntoConstraints = false
        downButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func constrainLeftButton() {
        leftButton.translatesAutoresizingMaskIntoConstraints = false
        
        leftButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        leftButton.trailingAnchor.constraint(equalTo: buttonStackViewLR.trailingAnchor).isActive = true
    }
    
    private func constrainRightButton() {
        rightButton.translatesAutoresizingMaskIntoConstraints = false
        rightButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    /// CONSTRAINTS FOR SQUARE
    private func constrainBlueSquare() {
        blueSquare.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            blueSquareHeightConstaint,
            blueSquareWidthConstraint,
            blueSquareCenterXConstraint,
            blueSquareCenterYConstraint
        ])
    }
    
    private func constrainButtonStackView() {
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            buttonStackView.heightAnchor.constraint(equalToConstant: 100),
            buttonStackView.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
    }
    
    private func constrainButtonStackViewLR() {
        buttonStackViewLR.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            buttonStackViewLR.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackViewLR.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -200),
            buttonStackViewLR.heightAnchor.constraint(equalToConstant: 50),
            buttonStackViewLR.widthAnchor.constraint(equalTo: view.widthAnchor),
        ])
    }
    
    private func constrainAnimationStepper() {
        animationStepper.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            animationStepper.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            animationStepper.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            
        ])
        
    }
    
    //MARK: - OBJ-C FUNCTIONS
    
    @objc func animationStepperPressed(_ stepper: UIStepper) {
        
        animationStepper.value += 1
        print("Chnaged Value: \(animationStepper.value)")
        animationStepper.value -= 1
    }
}


