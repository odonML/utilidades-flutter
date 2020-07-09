class ProvedoresModel {
  final String clave;
  final String nombre;
  final String emailContacto;
  final String cantidadProductos;
  final String cantidadProductosViejos;

  const ProvedoresModel(this.clave, this.nombre, this.emailContacto,
      this.cantidadProductos, this.cantidadProductosViejos);

  factory ProvedoresModel.fromJson(Map<String, dynamic> pro) {
    return ProvedoresModel(pro['clave'], pro['nombre'], pro['emailContacto'],
        pro['cantidadProductos'], pro['cantidadProductosViejos']);
  }

  Map<String, dynamic> toJson() => {
        'clave': clave,
        'nombre': nombre,
        'emailContacto': emailContacto,
        'cantidadProductos': cantidadProductos,
        'cantidadProductosViejos': cantidadProductosViejos
      };
}
