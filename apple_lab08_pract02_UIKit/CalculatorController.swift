import UIKit

class CalculatorController: UIViewController {

    private let num1TextField = UITextField()
    private let num2TextField = UITextField()
    private let resultLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Calculadora"
        view.backgroundColor = .systemBackground
        setupUI()
    }

    private func setupUI() {
        num1TextField.placeholder = "Ingrese el primer número"
        num1TextField.borderStyle = .roundedRect
        num1TextField.keyboardType = .decimalPad
        
        num2TextField.placeholder = "Ingrese el segundo número"
        num2TextField.borderStyle = .roundedRect
        num2TextField.keyboardType = .decimalPad
        
        resultLabel.text = "Resultado: -"
        resultLabel.font = .boldSystemFont(ofSize: 22)
        resultLabel.textAlignment = .center
        
        let buttonsStack = UIStackView()
        buttonsStack.axis = .horizontal
        buttonsStack.distribution = .fillEqually
        buttonsStack.spacing = 10
        
        let ops = ["+", "-", "*", "/"]
        for op in ops {
            let btn = UIButton(type: .system)
            btn.setTitle(op, for: .normal)
            btn.titleLabel?.font = .boldSystemFont(ofSize: 24)
            btn.backgroundColor = .systemBlue
            btn.setTitleColor(.white, for: .normal)
            btn.layer.cornerRadius = 8
            btn.addAction(UIAction { _ in self.calcular(operacion: op) }, for: .touchUpInside)
            buttonsStack.addArrangedSubview(btn)
        }

        let mainStack = UIStackView(arrangedSubviews: [num1TextField, num2TextField, buttonsStack, resultLabel])
        mainStack.axis = .vertical
        mainStack.spacing = 20
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mainStack)
        
        NSLayoutConstraint.activate([
            mainStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStack.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }

    private func calcular(operacion: String) {
        guard let text1 = num1TextField.text, let n1 = Double(text1),
              let text2 = num2TextField.text, let n2 = Double(text2) else {
            resultLabel.text = "Error: Ingrese números"
            return
        }

        var res = 0.0
        switch operacion {
        case "+": res = n1 + n2
        case "-": res = n1 - n2
        case "*": res = n1 * n2
        case "/":
            if n2 == 0 {
                resultLabel.text = "Error: Div entre 0"
                return
            }
            res = n1 / n2
        default: break
        }
        resultLabel.text = "Resultado: \(res)"
    }
}
