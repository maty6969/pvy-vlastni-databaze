from faker import Faker
import random
from datetime import datetime, timedelta

# Inicializace Faker pro češtinu
fake = Faker("cs_CZ")
random.seed(42)

# Parametry počtu záznamů
NUM_CUSTOMERS = 20
NUM_ROOMS = 15
NUM_RESERVATIONS = 30
NUM_SERVICES = 10
NUM_PAYMENT_METHODS = 3

# Pomocná funkce pro náhodné datum mezi dneškem a před rokem
def random_date(start_days_ago=365, end_days_ahead=365):
    start = datetime.now() - timedelta(days=start_days_ago)
    end = datetime.now() + timedelta(days=end_days_ahead)
    return fake.date_between(start_date=start, end_date=end).strftime('%Y-%m-%d')

# Generování zákazníků
customers = [
    (i, fake.first_name(), fake.last_name(), fake.unique.email(), fake.phone_number(),
     fake.date_of_birth(minimum_age=18, maximum_age=80).strftime('%Y-%m-%d'),
     fake.date_time_between(start_date='-3y', end_date='now').strftime('%Y-%m-%d %H:%M:%S'))
    for i in range(1, NUM_CUSTOMERS + 1)
]

# Generování pokojů
rooms = [
    (i, random.randint(100, 500), random.randint(1, 4),
     round(random.uniform(500, 5000), 2), random.choice(["single", "double", "suite"]),
     fake.sentence(nb_words=6))
    for i in range(1, NUM_ROOMS + 1)
]

# Generování způsobů platby
payment_methods = [
    (1, "card", "Platba kartou"),
    (2, "cash", "Platba v hotovosti"),
    (3, "transfer", "Bankovní převod")
]

# Generování služeb
services = [
    (i, fake.word().capitalize(), round(random.uniform(100, 2000), 2), fake.sentence(nb_words=6))
    for i in range(1, NUM_SERVICES + 1)
]

# Generování rezervací
reservations = [
    (i, random.choice(customers)[0], random.choice(rooms)[0],
     random_date(), random_date(),
     0,  # total_price vyplníme později
     random.choice(["pending", "confirmed", "cancelled"]),
     random.choice(payment_methods)[0],
     fake.date_time_between(start_date='-1y', end_date='now').strftime('%Y-%m-%d %H:%M:%S'))
    for i in range(1, NUM_RESERVATIONS + 1)
]

# Generování položek služeb pro rezervace
reservation_services_set = set()
reservation_services = []

for _ in range(NUM_RESERVATIONS * 2):  # každá rezervace může mít 1-2 služby
    res_id = random.choice(reservations)[0]
    serv_id = random.choice(services)[0]
    key = (res_id, serv_id)
    if key not in reservation_services_set:
        quantity = random.randint(1, 5)
        reservation_services.append((res_id, serv_id, quantity))
        reservation_services_set.add(key)

# Funkce pro generování SQL INSERT příkazů
sql_lines = []

def insert_lines(table, columns, values_list):
    sql_lines.append(f"-- {table}")
    for values in values_list:
        val_str = ", ".join(f"'{v}'" if isinstance(v, str) else str(v) for v in values)
        sql_lines.append(f"INSERT INTO {table} ({', '.join(columns)}) VALUES ({val_str});")
    sql_lines.append("")

# Vkládání dat
insert_lines("Customer", ["customer_id", "first_name", "last_name", "email", "phone", "birth_date", "registered_at"], customers)
insert_lines("Room", ["room_id", "room_number", "capacity", "price_per_night", "room_type", "description"], rooms)
insert_lines("PaymentMethod", ["payment_method_id", "name", "description"], payment_methods)
insert_lines("Service", ["service_id", "name", "price", "description"], services)
insert_lines("Reservation", ["reservation_id", "customer_id", "room_id", "check_in", "check_out", "total_price", "reservation_status", "payment_method_id", "created_at"], reservations)
insert_lines("Reservation_Service", ["reservation_id", "service_id", "quantity"], reservation_services)

# Uložení do SQL souboru
sql_dump_path = "hotel_demo_data.sql"
with open(sql_dump_path, "w", encoding="utf-8") as f:
    f.write("\n".join(sql_lines))

print(f"SQL dump uložen do souboru: {sql_dump_path}")
