from backend import create_app

#Dev mode default
app = create_app(env='dev')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)
