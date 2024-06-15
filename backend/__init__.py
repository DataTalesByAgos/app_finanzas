from flask import Flask
from flask_cors import CORS
from backend.config import DevelopmentConfig, ProductionConfig
from backend.extensions import db, migrate
from .routes import bp as routes_bp

def create_app(env='dev'):
    app = Flask(__name__, template_folder='./templates')
    
    # Cargar configuración según el entorno
    if env == 'dev':
        app.config.from_object(DevelopmentConfig)
    elif env == 'prod':
        app.config.from_object(ProductionConfig)
    else:
        raise ValueError(f'Invalid environment: {env}')

    CORS(app)
    
    db.init_app(app)
    migrate.init_app(app, db)

    app.register_blueprint(routes_bp)

    with app.app_context():
        from . import models
        db.metadata.reflect(db.engine)
    
    return app
