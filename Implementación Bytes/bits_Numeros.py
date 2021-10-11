import struct

doc_binario = open('binarios.txt', 'rb')


posicion = 1
while True:
    if posicion <= 10:
        byte = doc_binario.read(1)
        numero = int.from_bytes(byte, byteorder='big', signed=True)
        if numero != 0:
            print('El número es:', numero, '  y es de tipo:', type(numero))

    if posicion > 10:
        try:
            byte = doc_binario.read(4)
            numero = struct.unpack('f', byte)[0]
            print('El número es:', numero, '  y es de tipo:', type(numero))

        except:
            break
    posicion += 1

doc_binario.close()