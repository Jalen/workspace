
# Foreach($element in $input)
# {
# 		If ($element.name.contains(".exe"))
# 		{
# 				Write-Host -fore "red" $element
# 		}
# 		Else
# 		{
# 				Write-Host $element
# 		}
# }


begin
{
		"Evaluatin is beginning... one moment, please."
}
process
{
		if($_.name.contains(".exe"))
		{
				Write-Host -fore "Red" $_
		}
		else
		{
				Write-Host $_
		}
}
end
{
		"Evaluatin is end."
}