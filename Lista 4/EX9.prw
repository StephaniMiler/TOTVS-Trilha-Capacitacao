#INCLUDE 'PROTHEUS.CH'

/*9 – Desenvolva um programa para calcular a TMB
(Taxa Metabólica Basal) de um indivíduo. A fórmula
para calcular a TMB de homens, é diferente da
fórmula para mulheres. As fórmulas são:
o Para Homens:
? TMB = 66.5 + (13.75 * peso) + (5.003 *
altura em cm) – (6.75 * idade)

o Para Mulheres:
? TMB = 655.1 + (9.563 * peso) + (1.850 *
altura em cm) – (4.676 * idade) */

User Function Lista4_9()

  Local nPeso    := Space(20)
  Local nAltura  := Space(20)
  Local nIdade   := Space(20)
  Local cTitle   := 'Cálculo Taxa Metabólica Basal'
  Local oDlg     := NIL
  Local nOpcao   := 0   
  

  DEFINE MSDIALOG oDlg TITLE cTitle FROM 000, 000 TO 100, 700 PIXEL
  @ 014, 010 SAY 'Insira o seu peso: '         SIZE 100, 07 OF oDlg PIXEL
  @ 023, 010 SAY 'Insira a sua altura em cm: ' SIZE 100, 07 OF oDlg PIXEL
  @ 032, 010 SAY 'Insira a sua idade: '        SIZE 100, 07 OF oDlg PIXEL
  @ 014, 180 MSGET nPeso   SIZE 55, 11 OF oDlg PIXEL PICTURE '@E 99999999999'
  @ 023, 180 MSGET nAltura SIZE 55, 11 OF oDlg PIXEL PICTURE '@E 99999999999'
  @ 032, 180 MSGET nIdade  SIZE 55, 11 OF oDlg PIXEL PICTURE '@E 99999999999'
  @ 014, 250 BUTTON 'Homem'    SIZE 55, 11 OF oDlg PIXEL ACTION  TmbHomem(nPeso, nAltura, nIdade)
  @ 023, 250 BUTTON 'Mulher'   SIZE 55, 11 OF oDlg PIXEL ACTION TmbMulher(nPeso, nAltura, nIdade)
  @ 032, 250 BUTTON 'Cancelar' SIZE 55, 11 OF oDlg PIXEL ACTION (nOpcao := 2, oDlg:End())

    ACTIVATE MSDIALOG oDlg CENTERED

Return

Static Function TmbHomem(nPeso, nAltura, nIdade)

    Local nTmb := 0

    nTmb := 66.5 + (13.75 * VAL(nPeso)) + (5.003 * VAL(nAltura)) - (6.75 * VAL(nIdade))
    FwAlertInfo("Sua TMB é: "+ ALLTRIM(STR(nTmb)) + ' Calorias/Dia','TBM')

Return

Static Function TmbMulher(nPeso, nAltura, nIdade)

    Local nTmb := 0

    nTmb := 655.1  + (9.563 * VAL(nPeso)) + (1.850 * VAL(nAltura)) - (4.676 * VAL(nIdade))
    FwAlertInfo("Sua TMB é: "+ ALLTRIM(STR(nTmb)) + ' Calorias/Dia','TBM')

Return
