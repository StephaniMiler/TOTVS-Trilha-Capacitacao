#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVC_SEE
    Visualizar Tarefas
    @type  Function
    @author Stephani Miler
    @since 31/03/2023 
    /*/
User Function MVC_SEE()
    Local cAlias := 'ZZG'
    Local cTitle := 'Visualizar Tarefas'
    Local oBrowse := FwMBrowse():New()

    oBrowse:SetAlias(cAlias)
    oBrowse:SetDescription(cTitle)
    oBrowse:DisableDetails()
    oBrowse:DisableReport()
    oBrowse:ACTIVATE()

Return

Static Function MenuDef()
    Local aRotina := {}

    ADD OPTION aRotina TITLE 'Visualizar'  ACTION 'VIEWDEF.MVC_SEE' OPERATION 2 ACCESS 0 
   
Return aRotina

Static Function ModelDef()
    Local oModel   := MPFormModel():New('MVC_SEEM')
    Local oStruZZG := FwFormStruct(1, 'ZZG')
    Local oStruZZH := FwFormStruct(1, 'ZZH')

    
    oModel:AddFields('ZZGMASTER' , NIL, oStruZZG)
    oModel:AddGrid('ZZHDETAILS', 'ZZGMASTER', oStruZZH)

    oModel:SetDescription('Visualizar Tarefas')
    oModel:GetModel('ZZGMASTER'):SetDescription('Tarefas')
    oModel:GetModel('ZZHDETAILS'):SetDescription('Passos')


    oModel:SetRelation('ZZHDETAILS', {{'ZZH_FILIAL', 'xFilial("ZZH")'}, {'ZZH_TAR' , 'ZZG_NOME'}}, ZZH->(IndexKey(1)))

    oModel:SetPrimaryKey({'ZZG_COD', 'ZZH_COD'})

Return oModel

Static Function ViewDef()
    Local oModel   := FwLoadModel('MVC_SEE')
    Local oStruZZG := FwFormStruct(2, 'ZZG')
    Local oStruZZH := FwFormStruct(2, 'ZZH')
    Local oView    := FwFormView():New()

    oView:SetModel(oModel)
    oView:AddField('VIEW_ZZG', oStruZZG, 'ZZGMASTER')
    oView:AddGrid('VIEW_ZZH', oStruZZH, 'ZZHDETAILS')

    oView:CreateHorinzontalBox('Tarefa' , 30)
    oView:CreateHorinzontalBox('Passos', 70)

    oView:SetOwnerView('VIEW_ZZG' , 'Tarefa')
    oView:SetOwnerView('VIEW_ZZH', 'Passos')

Return oView
