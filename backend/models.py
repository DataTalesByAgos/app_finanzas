from . import db

class Property(db.Model):
    id_property = db.Column(db.Integer, primary_key=True)
    id_housing_state = db.Column(db.Integer, db.ForeignKey('state.id_state'))
    id_location = db.Column(db.Integer, db.ForeignKey('location.id_location'))
    price = db.Column(db.Float, nullable=False)

    def to_dict(self):
        return {
            'id_property': self.id_property,
            'id_housing_state': self.id_housing_state,
            'id_location': self.id_location,
            'price': self.price
        }

class Rental(db.Model):
    id_rental = db.Column(db.Integer, primary_key=True)
    id_real_estate = db.Column(db.Integer, db.ForeignKey('real_estate.id_real_estate'))
    id_property = db.Column(db.Integer, db.ForeignKey('property.id_property'))
    start_date = db.Column(db.Date, nullable=False)
    end_date = db.Column(db.Date, nullable=False)
    price = db.Column(db.Float, nullable=False)
    id_client = db.Column(db.Integer, db.ForeignKey('client.id_client'))
    transaction_id = db.Column(db.Integer, db.ForeignKey('transactions.id_transaction'))

    def to_dict(self):
        return {
            'id_rental': self.id_rental,
            'id_real_estate': self.id_real_estate,
            'id_property': self.id_property,
            'start_date': self.start_date,
            'end_date': self.end_date,
            'price': self.price,
            'id_client': self.id_client,
            'transaction_id': self.transaction_id
        }

class RealEstate(db.Model):
    id_real_estate = db.Column(db.Integer, primary_key=True)
    company_name = db.Column(db.String(255), nullable=False)
    id_location = db.Column(db.Integer, db.ForeignKey('location.id_location'))
    tax_id = db.Column(db.String(255), nullable=False)

    def to_dict(self):
        return {
            'id_real_estate': self.id_real_estate,
            'company_name': self.company_name,
            'id_location': self.id_location,
            'tax_id': self.tax_id
        }