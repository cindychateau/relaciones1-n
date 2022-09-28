from flask_app.config.mysqlconnection import connectToMySQL

class User:

    def __init__(self, data):
        self.id = data['id']
        self.first_name = data['first_name']
        self.last_name = data['last_name']
        self.email = data['email']
        self.created_at = data['created_at']
        self.updated_at = data['updated_at']
        self.classroom_id = data['classroom_id']

        #Relación con classroom
        self.name = data['name']

    @classmethod
    def guardar(cls, formulario):
        query = "INSERT INTO users(first_name, last_name, email, classroom_id) VALUES (%(first_name)s, %(last_name)s, %(email)s, %(classroom_id)s)"
        result = connectToMySQL('esquema_usuarios2').query_db(query, formulario)
        return result

    @classmethod
    def muestra_usuarios(cls):
        query = "SELECT users.*, name FROM users JOIN classrooms ON users.classroom_id = classrooms.id"
        results = connectToMySQL('esquema_usuarios2').query_db(query)
        users = []
        for user in results:
            users.append(cls(user))
        return users
