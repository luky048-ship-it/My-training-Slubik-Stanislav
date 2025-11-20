from fastapi import FastAPI, Path, status, Body
from typing import Annotated
from pydantic import BaseModel
from typing import List

app = FastAPI()

message_db = []


class Message(BaseModel):
    id: int
    text: str

    model_config = {
        "json_shema_exstra": {
            "examples":
                [
                    {
                        "texst": "Simple message",
                    }
                ]
        }
    }


@app.get("/")
async def get_all_message() -> dict:
    return {"messages": message_db}


@app.get("/message/{message_id}")
async def get_message(message_id: int) -> dict:
    return message_db[message_id]


@app.post("/message", status_code=status.HTTP_201_CREATED)
async def create_message(message: Message) -> str:
    if len(message_db) == 0:
        message.id = 0
    else:
        message.id = max([i.dict()['id'] for i in message_db]) + 1
    message_db.append(message)
    return f"Message created!"


@app.put("/message/{message_id}")
async def update_message(message_id: int, message: str = Body()) -> str:
    edit_message = message_db[int(message_id)]
    edit_message.text = message
    return f"Message updated!"

@app.delete("/message/{message_id}")
async def delete_message(message_id: str) -> str:
    message_db.pop(message_id)
    return f"Message deleted!"

@app.delete("/")
async def kil_message_all() -> str:
    message_db.clear()
    return "All message deleted!"
