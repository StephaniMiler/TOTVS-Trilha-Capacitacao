#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVC_VEI
    Menu Veículos
    @type  Function
    @author Stephani Miler
    @since 28/03/2023 
    /*/
User Function MVC_VEI()
    Local cAlias := 'ZZV'
    Local cTitle := 'Cadastro de Veículos'
    Local oBrowse := FwMBrowse():New()

    oBrowse:SetAlias(cAlias)
    oBrowse:SetDescription(cTitle)
    oBrowse:DisableDetails()
    oBrowse:DisableReport()
    oBrowse:ACTIVATE()
        
Return

Static Function MenuDef()
    Local aRotina := {}

    ADD OPTION aRotina TITLE 'Incluir'  ACTION 'VIEWDEF.MVC_VEI' OPERATION 3 ACCESS 0 
    ADD OPTION aRotina TITLE 'Alterar'  ACTION 'VIEWDEF.MVC_VEI' OPERATION 4 ACCESS 0
    ADD OPTION aRotina TITLE 'Excluir'  ACTION 'VIEWDEF.MVC_VEI' OPERATION 5 ACCESS 0 

Return aRotina

Static Function ModelDef()
    Local oModel   := MPFormModel():New('MVC_VEIM')
    Local oStruZZV := FwFormStruct(1, 'ZZV')
    
    oModel:AddFields('ZZVMASTER' , NIL, oStruZZV)
    oModel:SetDescription('Cadastro de Veículos')
    oModel:GetModel('ZZVMASTER'):SetDescription('Cadastro de Veículos')
    oModel:SetPrimaryKey({'ZZV_COD'})

Return oModel

Static Function ViewDef()
    Local oModel   := FwLoadModel('MVC_VEI')
    Local oStruZZV := FwFormStruct(2, 'ZZV')
    Local oView    := FwFormView():New()

    oView:SetModel(oModel)
    oView:AddField('VIEW_ZZV' , oStruZZV , 'ZZVMASTER')

    oView:CreateHorinzontalBox('Veículo' , 100)

    oView:SetOwnerView('VIEW_ZZV' , 'Veículo')

Return oView
