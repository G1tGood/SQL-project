
[General]
Version=1

[Preferences]
Username=
Password=2006
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=BASNAT
Name=COMMANDER
Count=400

[Record]
Name=NICKNAME
Type=VARCHAR2
Size=81
Data=FirstName
Master=

[Record]
Name=SOLIDERS_AFFECTION
Type=NUMBER
Size=
Data=Random(1,10)
Master=

[Record]
Name=SECURITY_CLEARANCE
Type=NUMBER
Size=
Data=Random(1, 5)
Master=

[Record]
Name=ID
Type=NUMBER
Size=
Data=Sequence(401, 1)
Master=

