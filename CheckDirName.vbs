Option Explicit
' ------------------
' 正規表現に一致するか
' ------------------
Function IsMutchRegExp(pattern, target)
	Dim reg, Match, Matches, RetStr
	Set reg = new RegExp
	reg.Pattern = pattern
	reg.IgnoreCase = False
	reg.Global = True
	Set Matches = reg.Execute(target)
	If Matches.Count = 1 Then
		IsMutchRegExp = True
	Else
		IsMutchRegExp = False
	End If
End Function
' --------------------------------------
' Main
' --------------------------------------
' 親フォルダの名前を取得する
Dim fsobj, DirectoryName
Set fsobj = CreateObject("Scripting.FileSystemObject")
DirectoryName = fsobj.GetFolder(fsobj.GetParentFolderName(WScript.ScriptFullName)).Name

' 正規表現パターン：先頭から末尾までの文字すべてが半角英数字か._-だけである
Dim Pattern
Pattern = "^[0-9a-zA-Z._-]+$"

Dim ret
ret = IsMutchRegExp(Pattern, DirectoryName)
If ret Then
	WScript.Echo "成功！ディレクトリ名 " & DirectoryName & " は " & Pattern & " に一致しています。"
	Dim WshShell
	Set WshShell = WScript.CreateObject("WScript.Shell")
'	WScript.Echo WshShell.CurrentDirectory
	WshShell.Exec("./dummy_FirstPush.bat")
Else
	Dim message
	message = "ディレクトリ名が無効な値です。" & vbNewLine & vbNewLine _
				& "ディレクトリ名に使えるのは半角英数字と._-(ドット、アンダーバー、ハイフン)だけです。" _
				& vbNewLine & vbNewLine _
				& "ディレクトリ名 " & DirectoryName & " を " _
				& "正規表現 " & Pattern & " に一致するように変更してください。"
	WScript.Echo message
	MsgBox message, vbOKOnly, "ディレクトリ名が無効な値です。"

	' これはGitHubのリモートリポジトリ名に使える文字がそれだけだからです。
	' このプログラムは、ディレクトリ名をリモートリポジトリ名に使います。
	' ローカルとリモートのリポジトリ名を一致させたいからです。
End If
