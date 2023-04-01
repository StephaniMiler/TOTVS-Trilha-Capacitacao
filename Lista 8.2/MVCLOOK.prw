#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVCLOOK
    Visualizar Blocos, Apartamentos e Proprietários
    @type  Function
    @author Stephani Miler
    @since 30/03/2023 
    /*/
User Function MVCLOOK()
    Local cAlias := 'ZZE'
    Local cTitle := 'Visualizar Bloco, Apartamentos e Proprietários'
    Local oBrowse := FwMBrowse():New()

    oBrowse:SetAlias(cAlias)
    oBrowse:SetDescription(cTitle)
    oBrowse:DisableDetails()
    oBrowse:DisableReport()
    oBrowse:ACTIVATE()

Return

Static Function MenuDef()
    Local aRotina := {}

    ADD OPTION aRotina TITLE 'Visualizar'  ACTION 'VIEWDEF.MVCLOOK' OPERATION 2 ACCESS 0 
   
Return aRotina

Static Function ModelDef()
    Local oModel   := MPFormModel():New('MVCLOOKM')
    Local oStruZZE := FwFormStruct(1, 'ZZE')
    Local oStruZZF := FwFormStruct(1, 'ZZF')

    
    oModel:AddFields('ZZEMASTER' , NIL, oStruZZE)
    oModel:AddGrid('ZZFDETAILS', 'ZZEMASTER', oStruZZF)

    oModel:SetDescription('Visualizar Blocos')
    oModel:GetModel('ZZEMASTER'):SetDescription('Blocos')
    oModel:GetModel('ZZFDETAILS'):SetDescription('Apartamentos')


    oModel:SetRelation('ZZFDETAILS', {{'ZZF_FILIAL', 'xFilial("ZZF")'}, {'ZZF_BLC' , 'ZZE_CDG'}}, ZZF->(IndexKey(1)))

    oModel:SetPrimaryKey({'ZZE_CDG', 'ZZF_CDG'})

Return oModel

Static Function ViewDef()
    Local oModel   := FwLoadModel('MVCLOOK')
    Local oStruZZE := FwFormStruct(2, 'ZZE')
    Local oStruZZF := FwFormStruct(2, 'ZZF')
    Local oView    := FwFormView():New()

    oView:SetModel(oModel)
    oView:AddField('VIEW_ZZE', oStruZZE, 'ZZEMASTER')
    oView:AddGrid('VIEW_ZZF', oStruZZF, 'ZZFDETAILS')

    oView:CreateHorinzontalBox('Bloco' , 30)
    oView:CreateHorinzontalBox('Apartamento', 70)

    oView:SetOwnerView('VIEW_ZZE' , 'Bloco')
    oView:SetOwnerView('VIEW_ZZF', 'Apartamento')

Return oView
