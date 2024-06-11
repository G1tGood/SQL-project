
[General]
Version=1

[Preferences]
Username=
Password=2350
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=BASNAT
Name=COMBAT_MEDIC
Count=400

[Record]
Name=QUALIFICATION
Type=VARCHAR2
Size=81
Data=List('MD', 'DO', 'RN', 'NP', 'PA', 'DDS', 'DMD', 'PharmD', 'DVM', 'OD')
Master=

[Record]
Name=IN_TRAINING
Type=NUMBER
Size=
Data=Random(0, 1)
Master=

[Record]
Name=ID
Type=NUMBER
Size=
Data=Sequence(1, 1)
Master=

