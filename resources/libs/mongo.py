from pymongo import MongoClient

client = MongoClient('mongodb+srv://qax:xperience@cluster0.ht0fbhe.mongodb.net/markdb?retryWrites=true&w=majority')

db = client['markdb']

def remove_user_by_email (user_email):
    users = db['users']
    users.delete_many({'email': user_email})
    print('Removendo o email' + user_email)
    