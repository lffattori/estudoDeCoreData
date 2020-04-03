//
//  ViewController.swift
//  MVC&Core Data
//
//  Created by Luiza Fattori on 31/03/20.
//  Copyright © 2020 Luiza Fattori. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController {

    var classe: [Alunos] = []
    var contexto:NSManagedObjectContext?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        contexto = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        pegarAInformacaoDosAlunos()
        // Do any additional setup after loading the view.
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return classe.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celula", for: indexPath) as! TableViewCell

        celula.nomeLabel.text = classe[indexPath.row].nome
        celula.cursoLabel.text = classe[indexPath.row].curso
        celula.tiaLabel.text = classe[indexPath.row].tia

        return celula
    }

    func pegarAInformacaoDosAlunos(){
        do {
            guard let contexto = contexto else {return}
            classe = try contexto.fetch(Alunos.fetchRequest())
            tableView.reloadData()
        } catch {
            print(error.localizedDescription)
        }
    }
    @IBAction func adicionarAluno(_ sender: Any) {
        let alerta = UIAlertController.init(title: "Adicionar",
                                            message: "Adicione um aluno",
                                            preferredStyle: .alert)

        let acaoSalvar = UIAlertAction.init(title: "Salvar",
                                            style: .default) {
                                                [unowned self] action in
                                                guard let nomeTextField = alerta.textFields?.first,
                                                    let nomeASalvar = nomeTextField.text
                                                    else {
                                                        return
                                                }
                                                self.salvar(nome: nomeASalvar)
        }

        let acaoCancelar = UIAlertAction.init(title: "Cancelar",
                                              style: .cancel)
        alerta.addTextField()

        alerta.addAction(acaoSalvar)
        alerta.addAction(acaoCancelar)

        present(alerta, animated: true)

    }

    func salvar(nome: String) {

        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }

        // 1
        let managedContext =
            appDelegate.persistentContainer.viewContext

        // 2
        let entity =
            NSEntityDescription.entity(forEntityName: "Alunos",
                                       in: managedContext)!

        let aluno = NSManagedObject(entity: entity,
                                    insertInto: managedContext)

        // 3
        aluno.setValue(nome, forKeyPath: "nome")

        // 4
        do {
            try managedContext.save()
            classe.append(aluno as! Alunos)
        } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
        }
    }
}

