
[General]
Version=1

[Preferences]
Username=
Password=2120
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=BASNAT
Name=MILITARY_RABBI
Count=400

[Record]
Name=CERTIFIED_RABBI
Type=NUMBER
Size=
Data=Random(0, 1)
Master=

[Record]
Name=PAYYTAN
Type=NUMBER
Size=
Data=Random(0, 1)
Master=

[Record]
Name=SECTOR
Type=VARCHAR2
Size=81
Data=List('Religous-Zionism', 'Haredi-Litai', 'Haredi-Hasidic')
Master=

[Record]
Name=ETHNICITY
Type=VARCHAR2
Size=81
Data=List('Ashkenazi', 'Iraqi', 'Buchari', 'Temani', 'Sphard')
Master=

[Record]
Name=PREACHER
Type=NUMBER
Size=
Data=Random(0, 1)
Master=

[Record]
Name=ID
Type=NUMBER
Size=
Data=Sequence(801, 1)
Master=

