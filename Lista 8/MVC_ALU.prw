#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVC_ALU
    Menu CNH
    @type  Function
    @author Stephani Miler
    @since 29/03/2023 
    /*/
User Function MVC_ALU()
    Local cAlias := 'ZZZ'
    Local cTitle := 'Cadastro de Alunos'
    Local oBrowse := FwMBrowse():New()

    oBrowse:SetAlias(cAlias)
    oBrowse:SetDescription(cTitle)
    oBrowse:DisableDetails()
    oBrowse:DisableReport()
    oBrowse:ACTIVATE()
        
Return

Static Function MenuDef()
    Local aRotina := {}

    ADD OPTION aRotina TITLE 'Incluir'  ACTION 'VIEWDEF.MVC_ALU' OPERATION 3 ACCESS 0 
    ADD OPTION aRotina TITLE 'Alterar'  ACTION 'VIEWDEF.MVC_ALU' OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE 'Excluir'  ACTION 'VIEWDEF.MVC_ALU' OPERATION 5 ACCESS 0 

Return aRotina

Static Function ModelDef()
    Local oModel   := MPFormModel():New('MVC_ALUM', NIL, {|oModel| ValidPos(oModel)})
    Local oStruZZZ:= FwFormStruct(1, 'ZZZ')
    Local aGatilho := FwStruTrigger('ZZZ_CDI', 'ZZZ_INSTRU', 'ZZD->ZZD_NOME', .T., 'ZZD', 1, "XFILIAL('ZZD')+ ALLTRIM(M->ZZC_CDI)")

    
    oStruZZZ:SetProperty('ZZZ_CODIGO', MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD, "GETSXENUM('ZZZ','ZZZ_CODIGO')"))

    oStruZZZ:AddTrigger(aGatilho[1], aGatilho[2], aGatilho[3], aGatilho[4])

    oModel:AddFields('ZZZMASTER' , NIL, oStruZZZ)
    oModel:SetDescription('Cadastro de Alunos')
    oModel:GetModel('ZZZMASTER'):SetDescription('Cadastro de Alunos')
    oModel:SetPrimaryKey({'ZZZ_CODIGO'})

Return oModel

Static Function ViewDef()
    Local oModel   := FwLoadModel('MVC_ALU')
    Local oStruZZZ := FwFormStruct(2, 'ZZZ')
    Local oView    := FwFormView():New()

    oView:SetModel(oModel)
    oView:AddField('VIEW_ZZZ' , oStruZZZ , 'ZZZMASTER')

    oView:CreateHorinzontalBox('Alunos' , 100)

    oView:SetOwnerView('VIEW_ZZZ' , 'Alunos')

    oView:SetFieldAction('ZZZ_AULAS' , {|oView| ValidAula(oView)})

Return oView

Static Function ValidPos(oModel)
    Local lRetorno  := .T.
    Local nOper     := oModel:GetOperation()
    Local cAula     := oModel:GetValue('ZZZMASTER' , 'ZZZ_AULAS')
    Local cInstrut  := oModel:GetValue('ZZZMASTER' , 'ZZZ_CDI')

    DBSELECTAREA('ZZD')
    If DBSEEK( XFILIAL('ZZD') + cInstrut )
        If nOper == 3
            If ZZD->ZZD_QUANT >= 5
                Help(,,'Instrutor não permitido!',,'O instrutor selecionado já possui 5 alunos', 1, 0,,,,,,{'Escolha um professor com menos de 5 alunos'})
                lRetorno := .F.
            Else 
                RecLock('ZZD', .F.)
                ZZD->ZZD_QUANT += 1
                ZZD->(MsUnLock())
                lRetorno := .T.
            Endif
        Elseif nOper == 5
            If alltrim(cAula) == '1'
                Help(,,'Exclusão não permitida!',,'Não é possível excluir alunos que estão fazendo aulas', 1, 0,,,,,,{'O aluno só poderá ser excluído quando não estiver em aula'})
                lRetorno := .F.
            Else
                If ZZD->ZZD_QUANT <> 0
                    RecLock('ZZD', .F.)
                    ZZD->ZZD_QUANT -= 1
                    ZZD->(MsUnLock())
                Endif
                lRetorno := .T.
            Endif    
           
        Endif   
      

    Else 
        Help(,,'Inclusão não permitida!',,'Não é possível incluir alunos sem informar o código do instrutor', 1, 0,,,,,,{'Informe o código do instrutor'})
        lRetorno := .F.

    Endif
   

Return lRetorno

Static Function ValidAula()
        
Return 
