from flask_app.config.mysqlconnection import connectToMySQL

class Classroom:

    def __init__(self, data):
        self.id = data['id']
        self.name = data['name']
        self.created_at = data['created_at']
        self.updated_at = data['updated_at']

        #La usaremos mañana para Dojos y Ninjas
        self.users = []
    
    @classmethod
    def muestra_salones(cls):
        query = "SELECT * FROM classrooms"
        results = connectToMySQL('esquema_usuarios2').query_db(query)
        classrooms = []
        for salon_clase in results:
            #salon_clase = {"id":1, "name":"Python"...}
            classrooms.append(cls(salon_clase)) #cls(salon_clase)->me crea una instancia de Classroom. append-> la instancia de classroom la agrega a la lista classrooms
        return classrooms