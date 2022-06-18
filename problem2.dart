import 'dart:math';
//codigo para buscar todas las islas(numeros 1)adyacentes en todas las direcciones 

void main() {
  int numeroDeIslas = 0;
  var rng = Random();
  var x = List.generate(5, (i) => List.generate(5, (j) => rng.nextInt(2)));
  var visited = List.generate(5, (i) => List.generate(5, (j) => false));

  void buscarAlrededor(int fila, int columna, int maximo) {
    int filaActual = fila > 0 ? fila - 1 : fila;
    int filaMax = fila < maximo - 1 ? fila + 1 : fila;
    int columnaActual = columna > 0 ? columna - 1 : columna;
    int columnaMax = columna < maximo - 1 ? columna + 1 : columna;
    visited[fila][columna] = true;
    for (int i = filaActual; i <= filaMax; i++) {
      for (int j = columnaActual; j <= columnaMax; j++) {
        if (x[i][j] == 1 && !visited[i][j]) {
          buscarAlrededor(i, j, x.length);
        }
        if(x[i][j] != 1){
          visited[i][j] = true;
        }
      }
    }
  }

  void contarIslas() {
    for (int i = 0; i < x.length; i++) {
      print(x[i]);
      for (int j = 0; j < x.length; j++) {
        if (x[i][j] == 1 && !visited[i][j]) {
          buscarAlrededor(i, j, x.length);
          numeroDeIslas++;
        }
      }
    }
  }

  contarIslas();
  print(numeroDeIslas);
}
