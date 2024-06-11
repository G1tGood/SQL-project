
[General]
Version=1

[Preferences]
Username=
Password=2312
Database=
DateFormat=
CommitCount=0
CommitDelay=0
InitScript=

[Table]
Owner=BASNAT
Name=SOLIDER
Count=1200

[Record]
Name=DATE_OF_BIRTH
Type=DATE
Size=
Data=random(01/01/1986, 30/12/2024)
Master=

[Record]
Name=ID
Type=NUMBER
Size=
Data=Sequence(1,1)
Master=

[Record]
Name=FIRST_NAME
Type=VARCHAR2
Size=81
Data=FirstName
Master=

[Record]
Name=RANK
Type=VARCHAR2
Size=81
Data=List('Private', 'Corporal', 'Sergeant', 'Lieutenant', 'Captain', 'Major', 'Colonel', 'Brigadier General', 'Major General', 'General')
Master=

[Record]
Name=RELIGION
Type=VARCHAR2
Size=81
Data=List('Judaism', 'Christianity', 'Islam', 'Hinduism', 'Buddhism', 'Sikhism', 'Taoism', 'Shinto', 'Bahaai', 'Jainism')
Master=

[Record]
Name=LAST_NAME
Type=VARCHAR2
Size=81
Data=LastName
Master=

