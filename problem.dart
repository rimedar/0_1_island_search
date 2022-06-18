import 'dart:math';

void main() {
  int numeroDeIslas = 0;
  var rng = Random();
  int size=5;
  var x = List.generate(size, (i) => List.generate(size, (j) => rng.nextInt(2)));
  var visited = List.generate(size, (i) => List.generate(size, (j) => false));

  void buscarAlrededor(int fila, int columna, int maximo) {
    int filaActual = fila > 0 ? fila - 1 : fila;
    int filaMax = fila < maximo - 1 ? fila + 1 : fila;
    int columnaActual = columna > 0 ? columna - 1 : columna;
    int columnaMax = columna < maximo - 1 ? columna + 1 : columna;


    visited[fila][columna] = true;
      if (x[filaActual][columna] == 1 && !visited[filaActual][columna]) {
        buscarAlrededor(filaActual, columna, x.length);
      }
      if (x[filaMax][columna] == 1 && !visited[filaMax][columna]) {
        buscarAlrededor(filaMax, columna, x.length);
      }
    
    if (x[fila][columnaActual] == 1 && !visited[fila][columnaActual]) {
        buscarAlrededor(fila, columnaActual, x.length);
      }
    if (x[fila][columnaMax] == 1 && !visited[fila][columnaMax]) {
        buscarAlrededor(fila, columnaMax, x.length);
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
