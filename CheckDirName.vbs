Option Explicit
' ------------------
' ���K�\���Ɉ�v���邩
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
' �e�t�H���_�̖��O���擾����
Dim fsobj, DirectoryName
Set fsobj = CreateObject("Scripting.FileSystemObject")
DirectoryName = fsobj.GetFolder(fsobj.GetParentFolderName(WScript.ScriptFullName)).Name

' ���K�\���p�^�[���F�擪���疖���܂ł̕������ׂĂ����p�p������._-�����ł���
Dim Pattern
Pattern = "^[0-9a-zA-Z._-]+$"

Dim ret
ret = IsMutchRegExp(Pattern, DirectoryName)
If ret Then
	WScript.Echo "�����I�f�B���N�g���� " & DirectoryName & " �� " & Pattern & " �Ɉ�v���Ă��܂��B"
	Dim WshShell
	Set WshShell = WScript.CreateObject("WScript.Shell")
'	WScript.Echo WshShell.CurrentDirectory
	WshShell.Exec("./dummy_FirstPush.bat")
Else
	Dim message
	message = "�f�B���N�g�����������Ȓl�ł��B" & vbNewLine & vbNewLine _
				& "�f�B���N�g�����Ɏg����͔̂��p�p������._-(�h�b�g�A�A���_�[�o�[�A�n�C�t��)�����ł��B" _
				& vbNewLine & vbNewLine _
				& "�f�B���N�g���� " & DirectoryName & " �� " _
				& "���K�\�� " & Pattern & " �Ɉ�v����悤�ɕύX���Ă��������B"
	WScript.Echo message
	MsgBox message, vbOKOnly, "�f�B���N�g�����������Ȓl�ł��B"

	' �����GitHub�̃����[�g���|�W�g�����Ɏg���镶�������ꂾ��������ł��B
	' ���̃v���O�����́A�f�B���N�g�����������[�g���|�W�g�����Ɏg���܂��B
	' ���[�J���ƃ����[�g�̃��|�W�g��������v������������ł��B
End If
