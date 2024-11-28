import csv

filename = "productos.csv"
delimiter = "."
data = [
    {"Producto": "Laptop Acer Aspire", "Categoría": "Electrónica", "Precio": "650 €", "Stock": 20},
    {"Producto": "Auriculares Sony", "Categoría": "Audio", "Precio": "300 €", "Stock": 15},
    {"Producto": "iPhone 14", "Categoría": "Telefonía", "Precio": "1100 €", "Stock": 10},
    {"Producto": "Lavadora LG 8kg", "Categoría": "Electrodomésticos", "Precio": "400 €", "Stock": 8},
    {"Producto": "Bicicleta de carretera", "Categoría": "Deportes", "Precio": "750 €", "Stock": 12},
    {"Producto": 'Smart TV Samsung 55"', "Categoría": "Televisión", "Precio": "900 €", "Stock": 7},
    {"Producto": "Cama King Size", "Categoría": "Muebles", "Precio": "1200 €", "Stock": 5},
    {"Producto": "Mesa de Comedor", "Categoría": "Hogar", "Precio": "350 €", "Stock": 6},
    {"Producto": "Zapatos Deportivos Nike", "Categoría": "Moda", "Precio": "80 €", "Stock": 50},
    {"Producto": "Cafetera Nespresso", "Categoría": "Cocina", "Precio": "150 €", "Stock": 25}
]

header = False

with open(filename, "w", newline="", encoding="utf-8") as f:
    
    fieldnames = ["Producto", "Categoría", "Precio", "Stock"]

    writer = csv.DictWriter(f, fieldnames=fieldnames, delimiter=delimiter)

    if header:
        writer.writeheader()
    
    for row in data:
        writer.writerow(row)
