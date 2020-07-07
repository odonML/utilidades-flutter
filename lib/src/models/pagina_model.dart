class PaginaModel {
  final String titulo;
  final String url;
  final bool estado;

  const PaginaModel(this.titulo, this.url, this.estado);

// traduce de json a objeto
  factory PaginaModel.fromJson(Map<String, dynamic> json) {
    return PaginaModel(json['titulo'],json['url'],json['estado']);
  }

// traduce de objeto a json
  Map<String, dynamic>toJson() => {
    'titulo': titulo,
    'url': url,
    'estado': estado
  };

}