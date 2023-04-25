#INCLUDE 'TOTVS.CH'

/*/{Protheus.doc} User Function LeituraArq
  Função para ler arquivo de texto
  @type  Function
  @author Stephani Miler
  @since 24/04/2023
  /*/
User Function LeituraArq()
  // Definindo a pasta e o nome do arquivo que será lido
  Local cPasta    := 'C:\Windows\Temp\lista 13 – ex1\'
  Local cArquivo  := 'Exercicio2.txt'
  // Instanciando a classe FWFileReader
  Local oArq      := FWFileReader():New(cPasta + cArquivo)
  Local cTxtLinha := ''
 
  // Verificando se o arquivo pode ser aberto
  if oArq:Open()
    if !oArq:EoF()
      while (oArq:HasLine())
          // Capturando o texto da linha atual
          cTxtLinha += oArq:GetLine(.T.)
      enddo
    endif
     
    // Fechando o arquivo
    oArq:Close()
  endif

  // Apresentando texto do arquivo em uma mensagem
  FwALertInfo(cTxtLinha, 'Conteúdo do arquivo Exercicio2.txt :')
Return
