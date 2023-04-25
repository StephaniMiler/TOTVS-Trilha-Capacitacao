#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function GeraLog
  Fun��o para gerar log
  @type  Function
  @author Stephani Sara Miler
  @since 25/04/2023
  /*/
User Function GeraLog()
  // Definindo a pasta como o Desktop do Windows
  Local cPasta   := 'C:\TOTVS12\Protheus\protheus_data\Challenge1\'
  Local cArquivo := 'LogChall1.txt'
  // Instanciando a classe FWFileWriter
  Local oWriter := FWFileWriter():New(cPasta + cArquivo, .T.)
    
  // Verificando se o arquivo j� existe na pasta
  if File(cPasta + cArquivo)
    FwAlertInfo('O arquivo j� existe na pasta!', 'Aten��o')
  else
    // Caso n�o consiga criar o arquivo
    if !oWriter:Create()
      FwAlertError('Houve um erro ao gerar o arquivo: ' + CRLF + oWriter:Error():Message, 'Aten��o')
    else
      
      oWriter:Write('Log Challenge 1:' + CRLF + '1) Gera��o de um ponto de entrada nos pedidos de venda' + CRLF;
       + '2) Gera��o da fun��o para gerar um relat�rio' + CRLF;
       + '3) Cria��o de uma fun��o para apresentar esse log' + CRLF;
       + '4) Cria��o de uma fun��o para mover os arquivos gerados para a pasta solicitada')
        
      // Fechando o arquivo
      oWriter:Close()
        
      // Perguntando se o usu�rio deseja abrir o arquivo criado
      if MsgYesNo('Arquivo gerado com sucesso (' + cPasta + cArquivo + ')!' + CRLF + 'Abrir arquivo?', 'Abrir?')
        ShellExecute('OPEN', cArquivo, '', cPasta, 1)
      endif
    endif
  endif
Return
