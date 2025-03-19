from fastapi import FastAPI
import uvicorn

# Criando a aplicação FastAPI
app = FastAPI()

# Rota raiz
@app.get("/")
def read_root():
    return {"message": "Olá, FastAPI!"}

# Rota com parâmetro
@app.get("/items/{item_id}")
def read_item(item_id: int, q: str = None):
    return {"item_id": item_id, "query": q}


# Execução do servidor
if __name__ == "__main__":
    uvicorn.run("main:app", host="0.0.0.0", port=8004, reload=True)
