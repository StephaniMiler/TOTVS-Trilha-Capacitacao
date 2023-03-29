#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVC_INS
    Menu Instrutor
    @type  Function
    @author Stephani Miler
    @since 28/03/2023 
    /*/
User Function MVC_INS()
    Local cAlias := 'ZZD'
    Local cTitle := 'Cadastro de Instrutores'
    Local oMark  := FwMarkBrowse():New()

    oMark:SetAlias(cAlias)
    oMark:SetDescription(cTitle)
    oMark:AddButton('Exc. marcados', 'U_EXCMARCADOS', 5, 1)
    oMark:SetFieldMark('ZZD_MARK')
    oMark:DisableDetails()
    oMark:DisableReport()
    oMark:ACTIVATE()
        
Return

Static Function MenuDef()
    Local aRotina := {}

    ADD OPTION aRotina TITLE 'Incluir'  ACTION 'VIEWDEF.MVC_INS' OPERATION 3 ACCESS 0 
    ADD OPTION aRotina TITLE 'Alterar'  ACTION 'VIEWDEF.MVC_INS' OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE 'Excluir'  ACTION 'VIEWDEF.MVC_INS' OPERATION 5 ACCESS 0 

Return aRotina

Static Function ModelDef()
    Local oModel   := MPFormModel():New('MVC_INSM', NIL, {|oModel| ValidPos(oModel)})
    Local oStruZZD := FwFormStruct(1, 'ZZD')
    
    oModel:AddFields('ZZDMASTER' , NIL, oStruZZD)
    oModel:SetDescription('Cadastro de Instrutores')
    oModel:GetModel('ZZDMASTER'):SetDescription('Cadastro de Instrutores')
    oModel:SetPrimaryKey({'ZZD_COD'})

Return oModel

Static Function ViewDef()
    Local oModel   := FwLoadModel('MVC_INS')
    Local oStruZZD := FwFormStruct(2, 'ZZD')
    Local oView    := FwFormView():New()

    oView:SetModel(oModel)
    oView:AddField('VIEW_ZZD' , oStruZZD , 'ZZDMASTER')

    oView:CreateHorinzontalBox('Instrutor' , 100)

    oView:SetOwnerView('VIEW_ZZD' , 'Instrutor')

Return oView


User Function EXCMARCADOS()
    If MSGYESNO( 'Deseja excluir os itens selecionados?' , 'Excluir instrutores')
        DBSELECTAREA('ZZD')
        ZZD->(DBGOTOP())
        While ZZD->(!EOF())
            If oMark:IsMark()
                If ZZD->ZZD_QUANT > 0
                    Help(,,'Exclusão não permitida!',,'Não é possível excluir professsores com alunos', 1, 0,,,,,,{'O Professor possui alunos'})
                Else
                    RecLock('ZZD', .F.)
                    ZZD->(DBDelete())
                    ZZD->(MsUnLock())
                Endif   
            Endif  
              ZZD->(DbSkip()) 
        Enddo
        oMark:Refresh(.T.)
    Endif 
    
Return

Static Function ValidPos(oModel)
    Local lRetorno  := .T.
    Local nOper     := oModel:GetOperation()
    Local dHabilit  := oModel:GetValue('ZZDMASTER', 'ZZD_1HAB')
    Local dNasc     := oModel:GetValue('ZZDMASTER', 'ZZD_NASC')
    Local cEscol    := ALLTRIM(oModel:GetValue('ZZDMASTER', 'ZZD_ESCOLA'))
    Local nTempoHab := DateDiffYear(dHabilit, DATE())
    Local nIdade    := DateDiffYear(dNasc, DATE())
    Local nAlunos   := oModel:GetValue('ZZDMASTER' , 'ZZD_QUANT')

    If nOper == 3 .or. nOper == 4
        If nTempoHab < 2
          Help(,,'Tempo de habilitação não permitido!',,'O mínimo são 2 anos de hablitação', 1, 0,,,,,,{'Cadastre um instrutor com experiência maior ou igual a dois anos'})
          lRetorno := .F.   
        Elseif nIdade < 21
          Help(,,'Idade não permitida!',,'A idade mínima é 21 anos', 1, 0,,,,,,{'Cadastre um instrutor com 21 anos ou mais'})
          lRetorno := .F.
        Elseif cEscol == '1'
          Help(,,'Escolaridade não permitida!',,'A escolaridade mínima é ensino médio', 1, 0,,,,,,{'Cadastre um instrutor com ensino médio ou superior'})
          lRetorno := .F.
        Else 
            lRetorno := .T.
        Endif
    Elseif nOper == 5
        If nAlunos > 0
            Help(,,'Exclusão não permitida!',,'Não é possível excluir professsores com alunos', 1, 0,,,,,,{'O Professor possui alunos'})
            lRetorno := .F.
        Endif
    Else
        lRetorno := .T.
    Endif
    
  
Return lRetorno
