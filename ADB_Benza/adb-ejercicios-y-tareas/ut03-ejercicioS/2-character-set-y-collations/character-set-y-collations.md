# Character Set y Collations (Ejercicios)

__Ejercicio 1__:
Mostrar todos los conjuntos de caracteres que contengan la palabra _utf_.

`SHOW CHARACTER SET LIKE "%utf%";`

---

__Ejercicio 2__:
Muestra todos los collations disponibles para el conjunto de caracteres _latin1_. 

`SHOW COLLATION WHERE Charset = "latin1";`

¿Cuál es el collation predeterminado de _latin1_?

`SHOW COLLATION WHERE Charset = "latin1" AND `Default` = "Yes"; -- Swedish1`

---

__Ejercicio 3__:
Filtra las collations del conjunto `utf8mb4` que sean sensibles a acentos (as). 

`SHOW COLLATION WHERE CHARSET = "utf8mb4" AND COLLATION LIKE "%_as_%";`

Filtra las collations del conjunto `utf8mb4` que sean sensibles a mayúsculas (cs).

`SHOW COLLATION WHERE CHARSET = "utf8mb4" AND COLLATION LIKE "%_cs";`

---

__Ejercicio 4__:
Compara si `ó` es igual a `o` utilizando el collation `utf8mb4_0900_ai_ci`. 

`SELECT "ó" = "o" COLLATE utf8mb4_0900_ai_ci;`

Compara si `ó` es diferente de `o` utilizando el collation `utf8mb4_0900_as_ci`.

`SELECT "ó" = "o" COLLATE utf8mb4_0900_as_ci;`

---

__Ejercicio 5__:

Compara si la `ñ` es igual a `n` utilizando los collations `utf8mb4_spanish_ci` y `utf8mb4_spanish2_ci`.

`SELECT "ñ" = "n" COLLATE utf8mb4_spanish_ci;`

`SELECT "ñ" = "n" COLLATE utf8mb4_spanish2_ci;`