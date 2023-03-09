#INCLUDE 'PROTHEUS.CH'

/*8 – Desenvolva um programa que calcule o IMC
(Índice de Massa Corporal) de um indivíduo. Para
descobrir o valor do IMC, basta dividir o peso pela
altura ao quadrado. O usuário deve informar seu
peso e sua altura. Após o usuário inserir os
dados, o programa deve informar qual o valor do
IMC e a classificação, que segue as seguintes
regras:
o Menor que 18,5: Magreza – Obesidade (Grau): 0
o Entre 18,5 e 24,9: Normal – Obesidade (Grau): 0
o Entre 25,0 e 29,9: Sobrepeso – Obes. (Grau): I
o Entre 30,0 e 39,9: Obesidade – Obes. (Grau): II
o Maior que 40,0: Obes. Grave - Obes. (Grau): III */

User Function Lista4_8()

  Local nPeso   := Space(20)
  Local nAltura := Space(20)
  Local nIMC    := 0
  Local cTitle := 'Cálculo IMC'
  Local oDlg   := NIL
  
     
  

  DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO 100, 600 PIXEL
  @ 014, 010 SAY 'Insira o peso: ' SIZE 100, 07 OF oDlg PIXEL
  @ 023, 010 SAY 'Insira a altura: ' SIZE 100, 07 OF oDlg PIXEL
  @ 014, 180 MSGET nPeso SIZE 55, 11 OF oDlg PIXEL PICTURE '@E 999'
  @ 023, 180 MSGET nAltura SIZE 55, 11 OF oDlg PIXEL PICTURE '@E 9.99'
  DEFINE SBUTTON FROM 011, 260 TYPE 1 ACTION (nOpcao := 1, oDlg:End()) ENABLE OF oDlg
  DEFINE SBUTTON FROM 025, 260 TYPE 2 ACTION (nOpcao := 2, oDlg:End()) ENABLE OF oDlg
  
  ACTIVATE MSDIALOG oDlg CENTERED


  nPeso    := Val(nPeso)
  nAltura  := Val(nAltura)
  
  
 if nOpcao == 1 .AND. nPeso > 0 .AND. nAltura > 0
     nIMC  := (nPeso) / (nAltura ^ 2)
            If nIMC < 18.5
             FwAlertInfo('O peso é: ' + CValToChar(nPeso) + ' kgs' + CRLF ;
             + 'A altura é: ' + CValToChar(nAltura) + ' m';
             + CRLF + 'O valor do IMC é: ' + cValToChar(nIMC) + CRLF + 'O usuário está abaixo do peso' , 'IMC')
            ElseIf nIMC > 18.5 .AND. nIMC < 24.9
             FwAlertInfo('O peso é: ' + CValToChar(nPeso) + ' kgs' + CRLF ;
             + 'A altura é: ' + CValToChar(nAltura) + ' m';
             + CRLF + 'O valor do IMC é: ' + cValToChar(nIMC) + CRLF + 'O usuário está com o peso normal' , 'IMC')
            ElseIf nIMC > 24.9 .AND. nIMC < 29.9
             FwAlertInfo('O peso é: ' + CValToChar(nPeso) + ' kgs' + CRLF ;
             + 'A altura é: ' + CValToChar(nAltura) + ' m';
             + CRLF + 'O valor do IMC é: ' + cValToChar(nIMC) + CRLF + 'O usuário está com sobrepeso, Obesidade grau 1' , 'IMC')
            ElseIf nIMC > 29.9 .AND. nIMC < 39.9
             FwAlertInfo('O peso é: ' + CValToChar(nPeso) + ' kgs' + CRLF ;
             + 'A altura é: ' + CValToChar(nAltura) + ' m';
             + CRLF + 'O valor do IMC é: ' + cValToChar(nIMC) + CRLF + 'O usuário está obeso, Obesidade grau 2' , 'IMC')
            Else
             FwAlertInfo('O peso é: ' + CValToChar(nPeso) + ' kgs' + CRLF ;
             + 'A altura é: ' + CValToChar(nAltura) + ' m';
             + CRLF + 'O valor do IMC é: ' + cValToChar(nIMC) + CRLF + 'O usuário está com obesidade grau 3' , 'IMC')
            Endif
  else
        FwAlertError('Cancelado pelo usuário ou o valor inserido é inválido!', 'Cancelado!')
  endif

Return
