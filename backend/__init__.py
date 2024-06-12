from flask import Flask
from flask_cors import CORS
from backend.config import Config
from backend.extensions import db, migrate
from .routes import bp as routes_bp

def create_app():
    app = Flask(__name__, template_folder='./templates')
    app.config.from_object(Config)
    
    CORS(app)
    
    db.init_app(app)
    migrate.init_app(app, db)

    app.register_blueprint(routes_bp)

    with app.app_context():
        from . import models
        db.metadata.reflect(db.engine)
    
    return app
