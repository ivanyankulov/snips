## Loading list with title "Legal Docs"
$list = $clientContext.Web.Lists.GetByTitle("Legal Docs")
$clientContext.Load($list)
$clientContext.ExecuteQuery()

## Loading item with ID 2
$item = $list.GetItemById("2")
$clientContext.Load($item)
$clientContext.ExecuteQuery()

## Loading list Field with static name "Governing_x0020_Law"
$field = $list.Fields.GetByInternalNameOrTitle("Governing_x0020_Law")
$clientContext.Load($field)
$clientContext.ExecuteQuery()

$taxField = [Microsoft.SharePoint.Client.ClientContext].GetMethod("CastTo").MakeGenericMethod([Microsoft.SharePoint.Client.Taxonomy.TaxonomyField]).Invoke($clientContext, $field)
$taxFieldValueCol = New-Object Microsoft.SharePoint.Client.Taxonomy.TaxonomyFieldValueCollection($clientContext, "-1;#China|b981aa76-17d4-4a32-acd9-fe992ee4620a;#-1;#Chinese|fa4ae9c4-1695-46d5-a02e-fb70ebd2abd5", $taxField)
$taxField.SetFieldValueByValueCollection($item, $taxFieldValueCol)

$item.Update()
$clientContext.Load($item)

$clientContext.ExecuteQuery()