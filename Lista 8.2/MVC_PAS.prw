#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVC_PAS
    Passos das Tarefas
    @type  Function
    @author Stephani Miler
    @since 31/03/2023 
    /*/
User Function MVC_PAS()
    Local cAlias := 'ZZH'
    Local cTitle := 'Passos das Tarefas'
    Local oBrowse := FwMBrowse():New()

    oBrowse:SetAlias(cAlias)
    oBrowse:SetDescription(cTitle)
    oBrowse:DisableDetails()
    oBrowse:DisableReport()
    oBrowse:ACTIVATE()
        
Return

Static Function MenuDef()
    Local aRotina := {}

    ADD OPTION aRotina TITLE 'Incluir'  ACTION 'VIEWDEF.MVC_PAS' OPERATION 3 ACCESS 0 
    ADD OPTION aRotina TITLE 'Alterar'  ACTION 'VIEWDEF.MVC_PAS' OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE 'Excluir'  ACTION 'VIEWDEF.MVC_PAS' OPERATION 5 ACCESS 0 

Return aRotina

Static Function ModelDef()
    Local oModel   := MPFormModel():New('MVC_PASM')
    Local oStruZZH := FwFormStruct(1, 'ZZH')

    oStruZZH:SetProperty('ZZH_COD', MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD, "GETSXENUM('ZZH','ZZH_COD')"))
    
    oModel:AddFields('ZZHMASTER' , NIL, oStruZZH)
    oModel:SetDescription('Cadastro de Tarefas')
    oModel:GetModel('ZZHMASTER'):SetDescription('Cadastro de Tarefas')
    oModel:SetPrimaryKey({'ZZH_COD'})

Return oModel

Static Function ViewDef()
    Local oModel   := FwLoadModel('MVC_PAS')
    Local oStruZZH := FwFormStruct(2, 'ZZH')
    Local oView    := FwFormView():New()

    oView:SetModel(oModel)
    oView:AddField('VIEW_ZZH' , oStruZZH , 'ZZHMASTER')

    oView:CreateHorinzontalBox('Passos da Tarefa' , 100)

    oView:SetOwnerView('VIEW_ZZH' , 'Passos da Tarefa')

Return oView
