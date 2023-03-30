#INCLUDE 'TOTVS.CH'
#INCLUDE 'FWMVCDEF.CH'

/*/{Protheus.doc} User Function MVC_VIE
    Visualizar Categorias Instrutores e Alunos
    @type  Function
    @author Stephani Miler
    @since 28/03/2023 
    /*/
User Function MVC_VIE()
    Local cAlias := 'ZZC'
    Local cTitle := 'Visualizar Categorias CNH, instrutores e alunos'
    Local oBrowse := FwMBrowse():New()

    oBrowse:SetAlias(cAlias)
    oBrowse:SetDescription(cTitle)
    oBrowse:DisableDetails()
    oBrowse:DisableReport()
    oBrowse:ACTIVATE()

Return

Static Function MenuDef()
    Local aRotina := {}

    ADD OPTION aRotina TITLE 'Visualizar'  ACTION 'VIEWDEF.MVC_VIE' OPERATION 2 ACCESS 0 
   
Return aRotina

Static Function ModelDef()
    Local oModel   := MPFormModel():New('MVC_VIEM')
    Local oStruZZC := FwFormStruct(1, 'ZZC')
    Local oStruZZD := FwFormStruct(1, 'ZZD')
    Local oStruZZZ := FwFormStruct(1, 'ZZZ')
    
    oModel:AddFields('ZZCMASTER' , NIL, oStruZZC)
    oModel:AddGrid('ZZDDETAILS', 'ZZCMASTER', oStruZZD)
    oModel:AddGrid('ZZZDETAILS', 'ZZDDETAILS' , oStruZZZ)

    oModel:SetDescription('Visualizar Categorias CNH, instrutores e alunos')
    oModel:GetModel('ZZCMASTER'):SetDescription('Visualizar Categorias')
    oModel:GetModel('ZZDDETAILS'):SetDescription('Visualizar Instrutores')
    oModel:GetModel('ZZZDETAILS'):SetDescription('Visualizar alunos')

    oModel:SetRelation('ZZDDETAILS', {{'ZZD_FILIAL', 'xFilial("ZZD")'}, {'ZZD_CATEG', 'ZZC_COD'}}, ZZD->(IndexKey(1)))
    oModel:SetRelation('ZZZDETAILS', {{'ZZZ_FILIAL', 'xFilial("ZZZ")'}, {'ZZZ_CDI' , 'ZZD_COD'}}, ZZZ->(IndexKey(1)))

    oModel:SetPrimaryKey({'ZZC_COD', 'ZZD_COD', 'ZZD_CODIGO'})

Return oModel

Static Function ViewDef()
    Local oModel   := FwLoadModel('MVC_VIE')
    Local oStruZZC := FwFormStruct(2, 'ZZC')
    Local oStruZZD := FwFormStruct(2, 'ZZD')
    Local oStruZZZ := FwFormStruct(2, 'ZZZ')
    Local oView    := FwFormView():New()

    oView:SetModel(oModel)
    oView:AddField('VIEW_ZZC', oStruZZC, 'ZZCMASTER')
    oView:AddGrid('VIEW_ZZD', oStruZZD, 'ZZDDETAILS')
    oView:AddGrid('VIEW_ZZZ', oStruZZZ, 'ZZZDETAILS')

    oView:CreateHorinzontalBox('CNH' , 30)
    oView:CreateHorinzontalBox('Instrutor', 35)
    oView:CreateHorizontalBox('Aluno', 35)

    oView:SetOwnerView('VIEW_ZZC' , 'CNH')
    oView:SetOwnerView('VIEW_ZZD', 'Instrutor')
    oView:SetOwnerView('VIEW_ZZZ', 'Aluno')

Return oView
