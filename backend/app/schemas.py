from pydantic import BaseModel, EmailStr
from typing import Optional

# Esquemas para Conductor
class ConductorCrear(BaseModel):
    nombre: str
    email: EmailStr
    password: str

class ConductorRespuesta(BaseModel):
    id: int
    nombre: str
    email: EmailStr

    class Config:
        from_attributes = True

# Esquema para Token
class Token(BaseModel):
    access_token: str
    token_type: str