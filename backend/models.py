from . import db

class Propiedad(db.Model):
    id_propiedad = db.Column(db.Integer, primary_key=True)
    id_estado_vivienda = db.Column(db.Integer, db.ForeignKey('estado.id_estado'))
    id_ubicacion = db.Column(db.Integer, db.ForeignKey('ubicacion.id_ubicacion'))
    precio = db.Column(db.Float, nullable=False)

    def to_dict(self):
        return {
            'id_propiedad': self.id_propiedad,
            'id_estado_vivienda': self.id_estado_vivienda,
            'id_ubicacion': self.id_ubicacion,
            'precio': self.precio
        }

class Alquiler(db.Model):
    id_alquiler = db.Column(db.Integer, primary_key=True)
    id_inmobiliaria = db.Column(db.Integer, db.ForeignKey('inmobiliaria.id_inmobiliaria'))
    id_propiedad = db.Column(db.Integer, db.ForeignKey('propiedad.id_propiedad'))
    fecha_inicio = db.Column(db.Date, nullable=False)
    fecha_fin = db.Column(db.Date, nullable=False)
    precio = db.Column(db.Float, nullable=False)
    id_cliente = db.Column(db.Integer, db.ForeignKey('cliente.id_cliente'))
    id_transaccion = db.Column(db.Integer, db.ForeignKey('transacciones.id_transaccion'))

    def to_dict(self):
        return {
            'id_alquiler': self.id_alquiler,
            'id_inmobiliaria': self.id_inmobiliaria,
            'id_propiedad': self.id_propiedad,
            'fecha_inicio': self.fecha_inicio,
            'fecha_fin': self.fecha_fin,
            'precio': self.precio,
            'id_cliente': self.id_cliente,
            'id_transaccion': self.id_transaccion
        }

class Inmobiliaria(db.Model):
    id_inmobiliaria = db.Column(db.Integer, primary_key=True)
    razon_social = db.Column(db.String(255), nullable=False)
    id_ubicacion = db.Column(db.Integer, db.ForeignKey('ubicacion.id_ubicacion'))
    cuit = db.Column(db.String(255), nullable=False)

    def to_dict(self):
        return {
            'id_inmobiliaria': self.id_inmobiliaria,
            'razon_social': self.razon_social,
            'id_ubicacion': self.id_ubicacion,
            'cuit': self.cuit
        }

