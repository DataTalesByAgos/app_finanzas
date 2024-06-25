from flask import Blueprint, request, jsonify, render_template
from .extensions import db

bp = Blueprint('api', __name__)

@bp.route('/')
def index():
    return render_template('index.html')

@bp.route('/<table_name>', methods=['GET'])
def get_all(table_name):
    try:
        table = db.Table(table_name, db.metadata, autoload_with=db.engine)
        query = db.session.query(table).all()
        data = [row._asdict() for row in query]

        response = jsonify({'success': True, 'message': f'All rows from {table_name} retrieved successfully', 'data': data})
        response.headers['Custom-Header'] = 'Value'
        return response, 200
    except Exception as e:
        return jsonify({'success': False, 'message': str(e)}), 500

@bp.route('/<table_name>/<int:id>', methods=['GET'])
def get_single(table_name, id):
    try:
        table = db.Table(table_name, db.metadata, autoload_with=db.engine)
        query = db.session.query(table).filter(table.columns.id == id).first()
        if query:
            return jsonify({'success': True, 'message': f'Row from {table_name} with ID {id} retrieved successfully', 'data': query._asdict()}), 200
        else:
            return jsonify({'success': False, 'message': f'Row from {table_name} with ID {id} not found'}), 404
    except Exception as e:
        return jsonify({'success': False, 'message': str(e)}), 500

@bp.route('/<table_name>', methods=['POST'])
def process_form():
    table_name = request.form['route']
    print('Table Name:', table_name) #Test
    
def create(table_name):
    try:
        table = db.Table(table_name, db.metadata, autoload_with=db.engine)
        data = request.get_json()
        new_row = table.insert().values(**data)
        db.session.execute(new_row)
        db.session.commit()
        return jsonify({'success': True, 'message': f'Row added to {table_name} successfully', 'data': data}), 201
    except Exception as e:
        return jsonify({'success': False, 'message': str(e)}), 500

@bp.route('/<table_name>/<int:id>', methods=['PUT', 'PATCH'])
def update(table_name, id):
    try:
        table = db.Table(table_name, db.metadata, autoload_with=db.engine)
        data = request.get_json()
        update_row = table.update().where(table.columns.id == id).values(**data)
        db.session.execute(update_row)
        db.session.commit()
        return jsonify({'success': True, 'message': f'Row from {table_name} with ID {id} updated successfully', 'data': data}), 200
    except Exception as e:
        return jsonify({'success': False, 'message': str(e)}), 500

@bp.route('/<table_name>/<int:id>', methods=['DELETE'])
def delete(table_name, id):
    try:
        table = db.Table(table_name, db.metadata, autoload_with=db.engine)
        delete_row = table.delete().where(table.columns.id == id)
        db.session.execute(delete_row)
        db.session.commit()
        return jsonify({'success': True, 'message': f'Row from {table_name} with ID {id} deleted successfully'}), 200
    except Exception as e:
        return jsonify({'success': False, 'message': str(e)}), 500
