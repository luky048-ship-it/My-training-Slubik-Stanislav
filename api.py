from fastapi import FastAPI

app = FastAPI()



@app.get("/")
async def welcome() -> dict:
    return {"message": "Welcome to the FastAPI application!"}


@app.get("/hello/{first_name}/{last_name}")
async def welcome_user(first_name: str, last_name: str) -> dict:
    return {"message": f"Hello, {first_name} {last_name}!"}



@app.get("/order/{order_id}")
async def get_order(order_id: int) -> dict:
    return {"order_id": order_id, "status": "Processing"}




