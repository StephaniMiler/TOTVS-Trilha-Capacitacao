#INCLUDE 'TOTVS.CH'

/* 16 - Escreva um algoritmo para ler as notas da 1a e
2a avaliações de um aluno, calcule e imprima a média
desse aluno. Só devem ser aceitos valores válidos
durante a leitura (0 a 10) para cada nota.
• 17 - Acrescente uma mensagem 'NOVO CÁLCULO
(S/N)?' ao final do exercício anterior. Se for
respondido 'S' deve retornar e executar um novo
cálculo, caso contrário deverá encerrar o
algoritmo. */

User Function Notas()

  Local nNota1 := 0
  Local nNota2 := 0
  Local nMedia := 0

  nNota1 := VAL(FwInputBox('Insira a primeira nota: ')) // Solicita a primeira nota

  while nNota1 < 0 .or. nNota1 > 10 //Verifica se o valor digitado é válido
    FWAlertError('VALOR INVÁLIDO! ' + CRLF + 'A nota deve estar entre 0 e 10') 
    nNota1 := VAL(FwInputBox('Insira a primeira nota: '))
  end

  nNota2 := VAL(FwInputBox('Insira a segunda nota: ')) // Solicita a segunda nota

  while nNota2 < 0 .or. nNota2 > 10 //Verifica se o valor digitado é válido
    FWAlertError('VALOR INVÁLIDO! ' + CRLF + 'A nota deve estar entre 0 e 10') 
    nNota2 := VAL(FwInputBox('Insira a segunda nota: '))
  end
  
  nMedia := (nNota1+nNota2) / 2 //Calculo da média

  FwAlertSuccess('A média é: ' + ALLTRIM(STR(nMedia)), 'MÉDIA')

Return
