import csv

filename = "direcciones.csv"
delimiter = ";"
data = [
    {"Tipo": "Calle", "Nombre": "Triana", "CP": "35002", "Municipio": "Las Palmmas de Gran Canaria", "Isla":"Gran Canaria", "Provincia":"Las Palmas"},
    {"Tipo": "Avenida", "Nombre": "Marítima", "CP": "38800", "Municipio": "San Sebastián de la Gomera", "Isla": "La Gomera", "Provincia": "Santa Cruz de Tenerife"},
    {"Tipo": "Calle", "Nombre": "de la Luz", "CP": "38400", "Municipio": "Puerto de la Cruz", "Isla": "Tenerife", "Provincia": "Santa Cruz de Tenerife"},
    {"Tipo": "Avenida", "Nombre": "de Los Majuelos", "CP": "38107", "Municipio": "La Laguna", "Isla": "Tenerife", "Provincia": "Santa Cruz de Tenerife"},
    {"Tipo": "Calle", "Nombre": "León y Castillo", "CP": "35500", "Municipio": "Arrecife", "Isla": "Lanzarote", "Provincia": "Las Palmas"},
    {"Tipo": "Calle", "Nombre": "Real", "CP": "38760", "Municipio": "Los Llanos de Aridane", "Isla": "La Palma", "Provincia": "Santa Cruz de Tenerife"},
    {"Tipo": "Avenida", "Nombre": "Juan Carlos I", "CP": "35600", "Municipio": "Puerto del Rosario", "Isla": "Fuerteventura", "Provincia": "Las Palmas"},
    {"Tipo": "Calle", "Nombre": "de la Constitución", "CP": "38820", "Municipio": "Hermigua", "Isla": "La Gomera", "Provincia": "Santa Cruz de Tenerife"},
    {"Tipo": "Calle", "Nombre": "de la Playa", "CP": "38914", "Municipio": "Valverde", "Isla": "El Hierro", "Provincia": "Santa Cruz de Tenerife"},
    {"Tipo": "Avenida ", "Nombre": "de Las Playas", "CP": "35510", "Municipio": "Tías", "Isla": "Lanzarote", "Provincia": "Las Palmas"}
]

header = True

with open(filename, "w", newline="", encoding="utf-8") as f:
    
    fieldnames = ["Tipo", "Nombre", "CP", "Municipio", "Isla", "Provincia"]

    writer = csv.DictWriter(f, fieldnames=fieldnames, delimiter=delimiter)

    if header:
        writer.writeheader()
    
    for row in data:
        writer.writerow(row)
