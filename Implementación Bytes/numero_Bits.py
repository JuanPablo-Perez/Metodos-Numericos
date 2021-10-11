import struct
def entero(cadena):
    z = bytes(cadena, 'utf-8')
    numero_Int = 0
    l = len(z)
    potencia = l-1;
    for i in range(0, l):
        # 45 es el ascii del signo -
        if (z[i] == 45 and i==0):
            # El número es negativo
            print('El número es negativo')
            potencia-=1
            # Agregar signo, 10000000 00000000, 2^15
            #   Bit 15 contiene signo 0 positivo 1 negativo
            numero_Int+= 0x8000
        elif (not(z[i]>=48 and z[i]<=57)):
            # 48 es el ascii de 0 y 57 de 9
            raise Exception('No es un número entero')
        else:
            # ** se usa para potenciación
            numero_Int += (z[i]-48)*(10**potencia)
            potencia-=1
    return numero_Int


def flotante(cadena):
    z = bytes(cadena, 'utf-8')
    numero_Float = 0
    l = len(z)
    l_Int = 0

    # Filtrado de entero y parte decimal
    for i in range(0, l):
        if z[i] == 46:
            break
        l_Int += 1

    parte_Entera = z[:l_Int]
    parte_Decimal = z[l_Int+1:]

    # Cálculo de la parte entera
    potencia_Int = l_Int-1
    for i in range(0, l_Int):
        # 45 es el ascii del signo -
        if (parte_Entera[i] == 45 and i==0):
            potencia_Int-=1
            # Agregar signo, 10000000 00000000 00000000 00000000, 2^31
            #   Bit 15 contiene signo 0 positivo 1 negativo
            numero_Float+= 0x8000
        elif (not(parte_Entera[i]>=48 and parte_Entera[i]<=57)):
            # 48 es el ascii de 0 y 57 de 9
            raise Exception('No es un número entero')
        else:
            # ** se usa para potenciación
            numero_Float += (parte_Entera[i]-48)*(10**potencia_Int)
            potencia_Int -= 1

    # Cálculo de la parte decimal
    for i in range(0, len(parte_Decimal)):
        # 45 es el ascii del signo -
        if (not (parte_Decimal[i] >= 48 and parte_Decimal[i] <= 57)):
            # 48 es el ascii de 0 y 57 de 9
            raise Exception('Usted no ha digitado caracteres válidos')
        else:
            # ** se usa para potenciación
            numero_Float += (parte_Decimal[i] - 48) * (1/(10 **(i+1)))

    return numero_Float


doc_Binario = open("binarios.txt", "wb")

#Únicamente con fines de comprobación
numerosProbados = []

print(' - - Enteros - -')
print('Ingrese 5 números enteros a convertir')
for i in range(1, 6):
    numero_A_Transformar = input(f'Ingrese el número {i}: ')
    numero_Int = entero(numero_A_Transformar)
    doc_Binario.write(numero_Int.to_bytes(2, byteorder='big'))

    # Únicamente con fines de comprobación
    numerosProbados.append(numero_A_Transformar)

print('')
print(' - - Float - -')
print('Ingrese 5 números float a convertir')
for i in range(1, 6):
    numero_A_Transformar = input(f'Ingrese el número {i}: ')
    numero_Float = flotante(numero_A_Transformar)
    doc_Binario.write(struct.pack("f", numero_Float))

    #Únicamente con fines de comprobación
    numerosProbados.append(numero_A_Transformar)

doc_Binario.close()

#Únicamente con fines de comprobación
print('Los números ingresados fueron: ', numerosProbados)
