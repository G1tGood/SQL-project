
[General]
Version=1

[Preferences]
Username=
Password=2151
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=SYS
Name=OPERATION
Count=400

[Record]
Name=OPERATION_DATE
Type=DATE
Size=
Data=random(01/01/1986, 30/12/2024)
Master=

[Record]
Name=LOCATION
Type=VARCHAR2
Size=81
Data=Country
Master=

[Record]
Name=OPERATION_ID
Type=NUMBER
Size=
Data=Random(1, 999999999)
Master=

[Record]
Name=COMMANDER_ID
Type=NUMBER
Size=
Data=Sequence(401,1)
Master=

[Record]
Name=MEDIC_ID
Type=NUMBER
Size=
Data=Sequence(1, 1)
Master=

[Record]
Name=TEAM_NUMBER
Type=NUMBER
Size=
Data=Sequence(1, 1)
Master=

