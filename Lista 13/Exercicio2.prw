#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function ArqTXT
  Fun��o para criar arquivo de texto
  @type  Function
  @author Stephani Miler
  @since 24/04/2023
  /*/
User Function ArqTXT()
  // Definindo a pasta e nome do arquivo
  Local cPasta   := 'C:\Windows\Temp\lista 13 � ex1\'
  Local cArquivo := 'Exercicio2.txt'
  // Instanciando a classe FWFileWriter
  Local oWriter := FWFileWriter():New(cPasta + cArquivo, .T.)
    
  // Verificando se o arquivo j� existe na pasta
  if File(cPasta + cArquivo)
    FwAlertInfo('O arquivo j� existe!', 'Aten��o')
  else
    // Caso n�o consiga criar o arquivo
    if !oWriter:Create()
      FwAlertError('Houve um erro ao gerar o arquivo: ' + CRLF + oWriter:Error():Message, 'Aten��o')
    else
      // Escrevendo no arquivo
      oWriter:Write('Ol�!' + CRLF + 'Esse foi o exerc�cio 2!')
        
      // Fechando o arquivo
      oWriter:Close()
        
      // Perguntando se o usu�rio deseja abrir o arquivo
      if MsgYesNo('Arquivo gerado com sucesso (' + cPasta + cArquivo + ')!' + CRLF + 'Abrir arquivo?', 'Abrir?')
        ShellExecute('OPEN', cArquivo, '', cPasta, 1)
      endif
    endif
  endif
Return
