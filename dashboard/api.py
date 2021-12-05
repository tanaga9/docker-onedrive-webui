from fastapi import FastAPI

app = FastAPI()

@app.get("/api/hello")
def index():
    return {"message": "Hello World"}
