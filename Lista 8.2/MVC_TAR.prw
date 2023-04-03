#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVC_TAR
    Cadastro de Tarefas
    @type  Function
    @author Stephani Miler
    @since 31/03/2023 
    /*/
User Function MVC_TAR()
    Local cAlias := 'ZZG'
    Local cTitle := 'Cadastro de Tarefas'
    Local oBrowse := FwMBrowse():New()

    oBrowse:SetAlias(cAlias)
    oBrowse:SetDescription(cTitle)
    oBrowse:DisableDetails()
    oBrowse:DisableReport()
    oBrowse:ACTIVATE()
        
Return

Static Function MenuDef()
    Local aRotina := {}

    ADD OPTION aRotina TITLE 'Incluir'  ACTION 'VIEWDEF.MVC_TAR' OPERATION 3 ACCESS 0 
    ADD OPTION aRotina TITLE 'Alterar'  ACTION 'VIEWDEF.MVC_TAR' OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE 'Excluir'  ACTION 'VIEWDEF.MVC_TAR' OPERATION 5 ACCESS 0 

Return aRotina

Static Function ModelDef()
    Local oModel   := MPFormModel():New('MVC_TARM')
    Local oStruZZG := FwFormStruct(1, 'ZZG')

    oStruZZG:SetProperty('ZZG_COD', MODEL_FIELD_INIT, FwBuildFeature(STRUCT_FEATURE_INIPAD, "GETSXENUM('ZZG','ZZG_COD')"))
    
    oModel:AddFields('ZZGMASTER' , NIL, oStruZZG)
    oModel:SetDescription('Cadastro de Tarefas')
    oModel:GetModel('ZZGMASTER'):SetDescription('Cadastro de Tarefas')
    oModel:SetPrimaryKey({'ZZG_COD'})

Return oModel

Static Function ViewDef()
    Local oModel   := FwLoadModel('MVC_TAR')
    Local oStruZZG := FwFormStruct(2, 'ZZG')
    Local oView    := FwFormView():New()

    oView:SetModel(oModel)
    oView:AddField('VIEW_ZZG' , oStruZZG , 'ZZGMASTER')

    oView:CreateHorinzontalBox('Tarefas' , 100)

    oView:SetOwnerView('VIEW_ZZG' , 'Tarefas')

Return oView

