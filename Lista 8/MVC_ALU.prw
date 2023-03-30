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
    Local oMark  := FwMarkBrowse():New()

    oMark:SetAlias(cAlias)
    oMark:SetDescription(cTitle)
    oMark:AddButton('Exc. marcados', 'U_EXCMARC', 5, 1)
    oMark:SetFieldMark('ZZZ_MARK')
    oMark:DisableDetails()
    oMark:DisableReport()
    oMark:ACTIVATE()
        
Return

Static Function MenuDef()
    Local aRotina := {}

    ADD OPTION aRotina TITLE 'Incluir'  ACTION 'VIEWDEF.MVC_ALU' OPERATION 3 ACCESS 0 
    ADD OPTION aRotina TITLE 'Alterar'  ACTION 'VIEWDEF.MVC_ALU' OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE 'Excluir'  ACTION 'VIEWDEF.MVC_ALU' OPERATION 5 ACCESS 0 

Return aRotina

Static Function ModelDef()
    Local oView   := MPFormModel():New('MVC_ALUM', NIL, {|oView| ValidPos(oView)})
    Local oStruZZZ:= FwFormStruct(1, 'ZZZ')
    Local aGatilho := FwStruTrigger('ZZZ_CDI', 'ZZZ_INSTRU', 'ZZD->ZZD_NOME', .T., 'ZZD', 1, "XFILIAL('ZZD')+ ALLTRIM(M->ZZZ_CDI)")

    
    oStruZZZ:SetProperty('ZZZ_CODIGO', MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD, "GETSXENUM('ZZZ','ZZZ_CODIGO')"))

    oStruZZZ:AddTrigger(aGatilho[1], aGatilho[2], aGatilho[3], aGatilho[4])

    oView:AddFields('ZZZMASTER' , NIL, oStruZZZ)
    oView:SetDescription('Cadastro de Alunos')
    oView:GetModel('ZZZMASTER'):SetDescription('Cadastro de Alunos')
    oView:SetPrimaryKey({'ZZZ_CODIGO'})

Return oView

Static Function ViewDef()
    Local oModel   := FwLoadModel('MVC_ALU')
    Local oStruZZZ := FwFormStruct(2, 'ZZZ')
    Local oView    := FwFormView():New()

    oView:SetModel(oModel)
    oView:AddField('VIEW_ZZZ' , oStruZZZ , 'ZZZMASTER')

    oView:CreateHorinzontalBox('Alunos' , 100)

    oView:SetOwnerView('VIEW_ZZZ' , 'Alunos')

    oView:SetFieldAction('ZZZ_AULAS' , {|oView| ValidAula(oView)})
    oView:SetFieldAction('ZZZ_CDI' , {|oView| ValidAula(oView)})

Return oView

Static Function ValidPos(oView)
    Local lRetorno  := .T.
    Local nOper     := oView:GetOperation()
    Local cAula     := oView:GetValue('ZZZMASTER' , 'ZZZ_AULAS')
    Local cInstrut  := oView:GetValue('ZZZMASTER' , 'ZZZ_CDI')

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

Static Function ValidAula(oView)
    Local oModel    := oView:GetModel('ZZZMASTER')
    Local cAula     := oView:GetValue('ZZZMASTER' , 'ZZZ_AULAS')
    Local cInstrut  := oView:GetValue('ZZZMASTER' , 'ZZZ_CDI')

    If alltrim(cInstrut) == '' .AND. alltrim(cAula) == '1'
        Help(,,'Inclusão não permitida!',,'Não é possível preencher o campo de aulas sem selecionar um instrutor', 1, 0,,,,,,{'Informe o código do instrutor'})
        oModel:SetValue('ZZZ_AULAS', '2')
    Elseif alltrim(cAula) == '1'
        DBSELECTAREA('ZZD')
        If DBSEEK( XFILIAL('ZZD') + cInstrut )
            If ZZD->ZZD_QUANT >= 5
                Help(,,'Instrutor não permitido!',,'O instrutor selecionado já possui 5 alunos', 1, 0,,,,,,{'Escolha um professor com menos de 5 alunos'})
                oModel:SetValue('ZZZ_AULAS', '2')
            Endif
        Endif
    Endif 
   oView:Refresh()   
Return 

User Function EXCMARC()
    If MSGYESNO( 'Deseja excluir os itens selecionados?' , 'Excluir alunos')
        DBSELECTAREA('ZZZ')
        ZZZ->(DBGOTOP())
        While ZZZ->(!EOF())
            If oMark:IsMark()
                If ALLTRIM(ZZZ->ZZZ_AULAS) == '1'
                    Help(,,'Exclusão não permitida!',,'Não é possível excluir alunos em aula', 1, 0,,,,,,{'O aluno está realizando aulas'})
                Else
                    DBSELECTAREA('ZZD')
                    If ZZD->(DBSEEK( XFILIAL('ZZD') + ZZZ->ZZZ_CDI))
                       If ZZD->ZZD_QUANT <> 0
                            RecLock('ZZD', .F.)
                            ZZD->ZZD_QUANT -= 1
                            ZZD->(MsUnLock())
                        Endif
                    Endif
                    RecLock('ZZZ', .F.)
                    ZZZ->(DBDelete())
                    ZZZ->(MsUnLock())
                Endif   
            Endif  
              ZZZ->(DbSkip()) 
        Enddo
        oMark:Refresh(.T.)
    Endif  
Return 
