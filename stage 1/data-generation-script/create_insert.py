import random
import string
import datetime

# Define possible values for VARCHAR fields
possible_values = {
    'first_name': ['John', 'Jane', 'Alice', 'Bob', 'Charlie'],
    'last_name': ['Smith', 'Doe', 'Johnson', 'Williams', 'Brown'],
    'rank': ['Private', 'Sergeant', 'Lieutenant', 'Captain', 'Major'],
    'religion': ['Christianity', 'Judaism', 'Islam', 'Hinduism', 'Buddhism'],
    'nickname': ['Eagle', 'Tiger', 'Wolf', 'Bear', 'Lion'],
    'sector': ['North', 'South', 'East', 'West', 'Central'],
    'ethnicity': ['Caucasian', 'African American', 'Asian', 'Hispanic', 'Other'],
    'qualification': ['Basic', 'Advanced', 'Expert'],
    'location': ['Base A', 'Base B', 'Base C', 'Base D', 'Base E'],
    'team_name': ['Alpha', 'Bravo', 'Charlie', 'Delta', 'Echo'],
    'responsibility': ['sniper', 'scout', 'demolition expert', 'communications specialist', 'heavy gunner', 'engineer',
                       'reconnaissance', 'marksman', 'grenadier', 'sharpshooter']
}

output_file = "insertAll.sql"


def generate_random_string(length=10):
    return ''.join(random.choices(string.ascii_letters + string.digits, k=length))


def generate_date_help():
    start_date = datetime.date(1980, 1, 1)
    end_date = datetime.date(2000, 12, 31)
    return start_date + (end_date - start_date) * random.random()


def generate_date():
    date = "DATE '" + generate_date_help().strftime("%Y-%m-%d") + "'"
    return date


def generate_sql_file(num_soldiers, num_commanders, num_teams, num_rabbis, num_medics, num_operations, num_soliders_in):
    soldiers = []
    commanders = []
    teams = []
    military_rabbis = []
    combat_medics = []
    operations = []
    soliders_in = []

    for i in range(1, num_soldiers + 1):
        soldier = {
            'date_of_birth': generate_date(),
            'id': i,
            'first_name': random.choice(possible_values['first_name']),
            'rank': random.choice(possible_values['rank']),
            'religion': random.choice(possible_values['religion']),
            'last_name': random.choice(possible_values['last_name']),
            'team_number': random.randint(1, num_teams)
        }
        soldiers.append(soldier)

    for i in range(1, num_commanders + 1):
        commander = {
            'nickname': random.choice(possible_values['nickname']),
            'soliders_affection': random.randint(1, 10),
            'security_clearance': random.randint(1, 5),
            'id': soldiers[i % num_soldiers]['id']
        }
        commanders.append(commander)

    for i in range(1, num_teams + 1):
        team = {
            'team_number': i,
            'name': random.choice(possible_values['team_name']),
            'religious': random.randint(0, 1),
            'commander_id': commanders[i % num_commanders]['id']
        }
        teams.append(team)

    for i in range(1, num_rabbis + 1):
        rabbi = {
            'certified_Rabbi': random.randint(0, 1),
            'Payytan': random.randint(0, 1),
            'sector': random.choice(possible_values['sector']),
            'ethnicity': random.choice(possible_values['ethnicity']),
            'preacher': random.randint(0, 1),
            'id': soldiers[i % num_soldiers]['id']
        }
        military_rabbis.append(rabbi)

    for i in range(1, num_medics + 1):
        medic = {
            'qualification': random.choice(possible_values['qualification']),
            'in_training': random.randint(0, 1),
            'id': soldiers[i % num_soldiers]['id']
        }
        combat_medics.append(medic)

    for i in range(1, num_operations + 1):
        operation = {
            'operation_date': generate_date(),
            'location': random.choice(possible_values['location']),
            'operation_id': i,
            'commander_id': commanders[i % num_commanders]['id'],
            'medic_id': combat_medics[i % num_medics]['id'],
            'team_number': teams[i % num_teams]['team_number']
        }
        operations.append(operation)
        
    for i in range(1, num_soliders_in + 1):
        solider_in = {
            'responsibility': random.choice(possible_values['responsibility']),
            'id': soldiers[i % num_soldiers]['id'],
            'team_number': teams[i % num_teams]['team_number']
        }
        soliders_in.append(solider_in)

    # Create SQL file
    with open(output_file, 'w') as f:
        # Insert soldiers
        for soldier in soldiers:
            f.write(
                f"INSERT INTO solider (date_of_birth, id, first_name, rank, religion, last_name) VALUES ({soldier['date_of_birth']}, {soldier['id']}, '{soldier['first_name']}', '{soldier['rank']}', '{soldier['religion']}', '{soldier['last_name']}');\n")

        # Insert commanders
        for commander in commanders:
            f.write(
                f"INSERT INTO commander (nickname, soliders_affection, security_clearance, id) VALUES ('{commander['nickname']}', {commander['soliders_affection']}, {commander['security_clearance']}, {commander['id']});\n")

        # Insert teams
        for team in teams:
            f.write(
                f"INSERT INTO team (team_number, name, religious, commander_id) VALUES ({team['team_number']}, '{team['name']}', {team['religious']}, {team['commander_id']});\n")

        # Insert military rabbis
        for rabbi in military_rabbis:
            f.write(
                f"INSERT INTO military_Rabbi (certified_Rabbi, Payytan, sector, ethnicity, preacher, id) VALUES ({rabbi['certified_Rabbi']}, {rabbi['Payytan']}, '{rabbi['sector']}', '{rabbi['ethnicity']}', {rabbi['preacher']}, {rabbi['id']});\n")

        # Insert combat medics
        for medic in combat_medics:
            f.write(
                f"INSERT INTO combat_medic (qualification, in_training, id) VALUES ('{medic['qualification']}', {medic['in_training']}, {medic['id']});\n")

        # Insert operations
        for operation in operations:
            f.write(
                f"INSERT INTO operation (operation_date, location, operation_id, commander_id, medic_id, team_number) VALUES ({operation['operation_date']}, '{operation['location']}', {operation['operation_id']}, {operation['commander_id']}, {operation['medic_id']}, {operation['team_number']});\n")

        # Insert solider-team connections
        for solider_in in soliders_in:
            f.write(
                f"INSERT INTO solider_in (responsibility, id, team_number) VALUES ('{solider_in['responsibility']}', '{solider_in['id']}', {solider_in['team_number']});\n")


if __name__ == '__main__':
    # Specify the number of entries for each table
    num_soldiers = 1200
    num_commanders = 400
    num_teams = 400
    num_rabbis = 400
    num_medics = 400
    num_operations = 400
    num_soliders_in = 400

    generate_sql_file(num_soldiers, num_commanders, num_teams, num_rabbis, num_medics, num_operations, num_soliders_in)
